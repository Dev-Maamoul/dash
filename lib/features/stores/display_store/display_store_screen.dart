import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_options.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:dashboard/features/stores/display_store/cubit/store_display_cubit.dart';
import 'package:dashboard/features/home/home_screen.dart';
import 'package:dashboard/widgets/table_order_widget.dart';
import 'package:dashboard/features/stores/stores/stores_screen.dart';
import 'package:dashboard/shared/api/methods/store_methods%20.dart';
import 'package:dashboard/shared/constants/colors_app.dart';
import 'package:dashboard/shared/models/all_stores_model.dart';
import 'package:dashboard/shared/models/product_model.dart';
import 'package:dashboard/shared/models/revenues_payments_store_model.dart';
import 'package:dashboard/shared/routes/route_generator.dart';
import 'package:dashboard/widgets/buttons/button_custom.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DisplayScreenStore extends StatelessWidget {
  const DisplayScreenStore({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreDisplayCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<StoreDisplayCubit>();
          cubit.storeData = GoRouterState.of(context).extra as StoreModel;

          Future.delayed(Duration(milliseconds: 100), () {
            cubit.startLoadData(idStore: cubit.storeData!.id.toString());
          });
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Column(
                        children: [
                          BlocBuilder<StoreDisplayCubit, StoreDisplayState>(
                            builder: (context, state) {
                              return CardActivistStore(
                                status: cubit.storeData!.accountStatus!,
                                tapAccept: () {
                                  cubit.changeStatus(
                                    idStore: cubit.storeData!.id.toString(),
                                    status: StatusStore.active,
                                  );
                                },
                                tapReject: () {
                                  cubit.changeStatus(
                                    idStore: cubit.storeData!.id.toString(),
                                    status: StatusStore.reject,
                                  );
                                },
                                tapStop: () {
                                  cubit.changeStatus(
                                    idStore: cubit.storeData!.id.toString(),
                                    status: StatusStore.suspended,
                                  );
                                },
                                tapBloc: () {
                                  Future.delayed(Duration(seconds: 1), () {
                                    cubit.changeStatus(
                                      idStore: cubit.storeData!.id.toString(),
                                      status: StatusStore.block,
                                    );
                                  });
                                },
                                toActivate: () {
                                  Future.delayed(Duration(seconds: 1), () {
                                    cubit.changeStatus(
                                      idStore: cubit.storeData!.id.toString(),
                                      status: StatusStore.active,
                                    );
                                  });
                                },
                              );
                            },
                          ),
                          SizedBox(height: 16),
                          InfoTransactionsStoreCardWidget(
                            onTapOrder: () {
                              context.go(
                                Routes.ordersStore,
                                extra: cubit.storeData,
                              );
                            },
                          ),
                          SizedBox(height: 16),

                          BlocBuilder<StoreDisplayCubit, StoreDisplayState>(
                            buildWhen: (previous, current) {
                              if (current is UpdateSelected) {
                                return true;
                              }
                              return false;
                            },
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CardSelectRadio(
                                    title: "المنتجات",
                                    value: SelectType.products,
                                    groupValue: cubit.selectedOption,
                                    onChanged: () {
                                      cubit.changeTypeDisplay(
                                        selected: SelectType.products,
                                      );
                                    },
                                  ),
                                  SizedBox(width: 16),
                                  CardSelectRadio(
                                    title: "الطلبات",
                                    value: SelectType.orders,
                                    groupValue: cubit.selectedOption,
                                    onChanged: () {
                                      cubit.changeTypeDisplay(
                                        selected: SelectType.orders,
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 16),
                          BlocBuilder<StoreDisplayCubit, StoreDisplayState>(
                            builder: (context, state) {
                              if (state is SuccessProductState) {
                                if (cubit.selectedOption == SelectType.orders) {
                                  return Container(
                                    color: Colors.white,
                                    height: 0.65.sh,
                                    width: 0.70.sw,
                                    child: TableOrdersWidget(
                                      orders: cubit.ordersStore,
                                      onChanged: (p0) {
                                        context.go(
                                          Routes.ordersDisplay,
                                          extra: p0,
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  return ProductsStoreWidget(
                                    product: cubit.products,
                                    childAspectRatioGrid:
                                        _calculateChildAspectRatio(context),
                                    crossAxisCountGrid:
                                        _calculateCrossAxisCount(context),
                                    heightContainer: sizeContainerOrders(
                                      context,
                                    ),
                                    onTap: (product) {},
                                  );
                                }
                              }
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Column(
                                    spacing: 16,
                                    children: [
                                      Text("أنتظر تحميل المنتجات"),
                                      CircularProgressIndicator(
                                        color: ColorsApp.systemGreen,
                                        strokeWidth: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<StoreDisplayCubit, StoreDisplayState>(
                      builder: (context, state) {
                        if (state is SuccessProductState) {
                          return SideInfoStore(
                            storeData: cubit.storeData!,
                            revenuesPaymentsStore: cubit.revenuesPaymentsStore,
                            ordersCount: cubit.ordersStore.length,
                            productsCount: cubit.products.length,
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Column(
                              spacing: 16,
                              children: [
                                Text("أنتظر تحميل المنتجات"),
                                CircularProgressIndicator(
                                  color: ColorsApp.systemGreen,
                                  strokeWidth: 10,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    print(width);

    if (width < 1200) return 3;
    if (width < 1300) return 3;

    return 4;
  }

  double _calculateChildAspectRatio(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width < 1000) return 7 / 3.3;
    if (width < 1050) return 7 / 2.5;
    if (width < 1300) return 7 / 2.9;

    return 7 / 3;
  }

  double sizeContainerOrders(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    print(height);

    if (height < 800) return 0.58.sh;
    if (height < 850) return 0.60.sh;
    if (height < 900) return 0.63.sh;
    if (height < 950) return 0.65.sh;
    if (height < 1200) return 0.65.sh;

    return 0.65.sh;
  }
}

class CardDisplayInfoStore extends StatelessWidget {
  const CardDisplayInfoStore({
    super.key,
    required this.title,
    required this.dataDisplay,
  });
  final String title;
  final List<CardDisplayInfoStoreData> dataDisplay;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: ColorsApp.systemGreen,
          ),
        ),
        ...List.generate(
          dataDisplay.length,
          (index) => LabelCard(
            title: dataDisplay[index].title,
            value: dataDisplay[index].value,
            flex: dataDisplay[index].flex,
          ),
        ),
      ],
    );
  }
}

class CardDisplayInfoStoreData {
  final String title;
  final String value;
  final int? flex;

  CardDisplayInfoStoreData({
    required this.title,
    required this.value,
    this.flex = 1,
  });
}

///
///
///
///
///
///
///
///
class InfoTransactionsStoreCardWidget extends StatelessWidget {
  const InfoTransactionsStoreCardWidget({super.key, this.onTapOrder});
  final Function()? onTapOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 0.60.sw,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("المعاملات", style: TextStyle(fontWeight: FontWeight.w600)),

            // CardHomeInfo(
            //   title: 'الطلبات',
            //   // value: "storesCount",
            //   assetsPath: 'assets/svg/weui_shop-outlined.svg',
            //   onTap: onTapOrder,
            // ),
            CardHomeInfo(
              title: 'التواصل مع المتجر',
              // value: "storesCount",
              assetsPath: 'assets/svg/weui_shop-outlined.svg',
            ),
            CardHomeInfo(
              title: 'رفع العقد',
              // value: "storesCount",
              assetsPath: 'assets/svg/weui_shop-outlined.svg',
            ),
          ],
        ),
      ),
    );
  }
}

///
///
///
///
///
///
///
class LabelCard extends StatelessWidget {
  const LabelCard({super.key, required this.title, this.value, this.flex});
  final String title;
  final String? value;
  final int? flex;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrained) {
        return SizedBox(
          width: constrained.maxWidth / (flex ?? 1),
          child: ListTile(
            title: Text(
              "$title:",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
            subtitle: Text(
              value ?? "----",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
        );
      },
    );
  }
}

///
///
///
///
///
///
///
///
class CardActivistStore extends StatelessWidget {
  const CardActivistStore({
    super.key,
    this.tapAccept,
    this.tapReject,
    this.tapStop,
    this.tapBloc,
    required this.status,
    this.toActivate,
  });
  final Function()? tapAccept;
  final Function()? tapReject;
  final Function()? tapStop;
  final Function()? tapBloc;
  final Function()? toActivate;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 0.60.sw,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("إدارة المتجر", style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Row(
              spacing: 8,
              children: [
                Flexible(
                  child: ButtonCustom(
                    title: "قبول",
                    width: 100,
                    colorBg: ColorsApp.systemGreen,
                    onPressed: status.toLowerCase() != 'processing'
                        ? null
                        : tapAccept,
                  ),
                ),
                Flexible(
                  child: ButtonCustom(
                    title: "رفض",
                    width: 100,
                    colorBg: Colors.red.shade300,
                    onPressed: status.toLowerCase() == 'processing'
                        ? tapReject
                        : null,
                  ),
                ),
                Flexible(
                  child: ButtonCustom(
                    width: 100,
                    title: "ايقاف",
                    colorBg: Colors.grey,
                    onPressed: status.toLowerCase() == 'active'
                        ? tapStop
                        : null,
                  ),
                ),
                Flexible(
                  child: ButtonCustom(
                    width: 100,
                    title: "حظر",
                    colorBg: Colors.red,
                    onPressed: status.toLowerCase() == 'active'
                        ? tapBloc
                        : null,
                  ),
                ),
                Flexible(
                  child: ButtonCustom(
                    width: 100,
                    title: "تنشيط",
                    colorBg: Colors.green,
                    onPressed:
                        status.toLowerCase() != 'active' &&
                            (status.toLowerCase() == 'reject' ||
                                status.toLowerCase() == 'closed' ||
                                status.toLowerCase() == 'suspended' ||
                                status.toLowerCase() == 'block')
                        ? toActivate
                        : null,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// processing
// reject
// active
// closed
// suspended
// block
///
///
///
///
class DataCardDataInfo {
  final String title;
  final String value;

  DataCardDataInfo({required this.title, required this.value});
}

class CardDataInfo extends StatelessWidget {
  const CardDataInfo({super.key, this.dataView});
  final List<DataCardDataInfo>? dataView;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dataView != null)
          Row(
            children: [
              ...dataView!
                  .map(
                    (item) => Expanded(
                      child: Column(
                        children: [Text(item.title), Text(item.value)],
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        Divider(color: Colors.grey, thickness: 0.3),
      ],
    );
  }
}

///
///
///
///
///
///
class ProductsStoreWidget extends StatelessWidget {
  const ProductsStoreWidget({
    super.key,
    this.heightContainer = 500,
    this.crossAxisCountGrid = 3,
    this.childAspectRatioGrid = 7 / 2,
    this.product,
    this.onTap,
  });
  final double? heightContainer;
  final int? crossAxisCountGrid;
  final double? childAspectRatioGrid;
  final List<ProductModel>? product;
  final Function(ProductModel)? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightContainer,
      width: 0.60.sw,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("المنتجات", style: TextStyle(fontWeight: FontWeight.w600)),
          if (product == null || product!.isEmpty)
            Expanded(child: Center(child: Text("No Data"))),
          if (product != null || product!.isNotEmpty)
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCountGrid!,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: childAspectRatioGrid!,
                ),
                itemCount: (product ?? []).length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 150,
                        maxWidth: 500,
                      ),

                      child: CardDisplayAccount(
                        name: (product ?? [])[index].name ?? '-----',
                        subtitle1: (product ?? [])[index].description ?? "",
                        subtitle2: (product ?? [])[index].category?.ar ?? "",
                        onTap: () {
                          if (onTap != null) {
                            onTap!((product ?? [])[index]);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

///
///
///
///
///
///
///
class SideInfoStore extends StatelessWidget {
  const SideInfoStore({
    super.key,
    required this.storeData,
    required this.revenuesPaymentsStore,
    this.productsCount,
    this.ordersCount,
  });
  final StoreModel storeData;
  final RevenuesPaymentsStoreModel revenuesPaymentsStore;
  final int? productsCount;
  final int? ordersCount;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                // height: 0.65.sh,
                width: 0.30.sw,
                constraints: BoxConstraints(minWidth: 300, maxWidth: 400),

                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 0.090.sw,
                      width: 1.sw,
                      constraints: BoxConstraints(
                        minWidth: 80,
                        minHeight: 80,
                        maxHeight: 120,
                        maxWidth: 200,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.050),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: storeData.avatarImg ?? "---",
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                value: downloadProgress.progress,
                              ),
                            ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    SizedBox(height: 8),

                    Text(
                      storeData.storeName ?? "-----",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    //------
                    CardDataInfo(
                      dataView: [
                        DataCardDataInfo(
                          title: "الارباح",
                          value: "ريال ${revenuesPaymentsStore.total}",
                        ),
                        DataCardDataInfo(
                          title: "المنتجات",
                          value: "${productsCount ?? 0}",
                        ),
                        DataCardDataInfo(
                          title: "الطلبات",
                          value: "${ordersCount ?? 0}",
                        ),
                        DataCardDataInfo(title: "السائقين", value: "0"),
                      ],
                    ),
                    Container(
                      constraints: BoxConstraints(
                        minHeight: 350,
                        maxHeight: 350,
                      ),
                      width: 1000,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          disableCenter: true,
                          enableInfiniteScroll: true,
                        ),

                        items: [
                          CardDisplayInfoStore(
                            title: "عامة",
                            dataDisplay: [
                              CardDisplayInfoStoreData(
                                title: "النوع",
                                value: storeData.typeCategory?.ar ?? '----',
                              ),
                              CardDisplayInfoStoreData(
                                title: "العنوان",
                                value: storeData.city?.locationText ?? '----',
                              ),
                              CardDisplayInfoStoreData(
                                title: "المدينة",
                                value: storeData.city?.cityAr ?? '----',
                              ),
                              CardDisplayInfoStoreData(
                                title: "الوصف",
                                value: storeData.bio ?? '----',
                              ),
                            ],
                          ),
                          CardDisplayInfoStore(
                            title: 'معلومات الشركة',
                            dataDisplay: [
                              CardDisplayInfoStoreData(
                                title: "اسم المالك",
                                value: storeData.ownerName ?? '----',
                              ),
                              CardDisplayInfoStoreData(
                                title: "البريد الالكتروني",
                                value: storeData.email ?? '----',
                              ),
                              CardDisplayInfoStoreData(
                                title: "الهوية الوطنية",
                                value: storeData.ownerIdentity ?? '----',
                              ),
                              CardDisplayInfoStoreData(
                                title: "تاريخ الانضمام",
                                value: storeData.createdAt ?? '----',
                              ),
                            ],
                          ),
                          CardDisplayInfoStore(
                            title: "المعلومات البنكية",
                            dataDisplay: [
                              CardDisplayInfoStoreData(
                                title: "اسم البنك",
                                value: storeData.storeBanks?.bankAr ?? '----',
                              ),
                              CardDisplayInfoStoreData(
                                title: "الايبان",
                                value: storeData.storeBanks?.iban ?? '----',
                              ),
                            ],
                          ),
                          CardDisplayInfoStore(
                            title: "معلومات المتجر",
                            dataDisplay: [
                              CardDisplayInfoStoreData(
                                title: "المجال التجاري",
                                value:
                                    storeData
                                        .storeCredential
                                        ?.businessPurpose ??
                                    '----',
                              ),
                              CardDisplayInfoStoreData(
                                title: "الرقم التجاري",
                                value:
                                    storeData.storeCredential?.crNumber ??
                                    '----',
                              ),
                              CardDisplayInfoStoreData(
                                title: "اسم شهادة العمل الحر",
                                value:
                                    storeData.storeCredential?.nameFreelance ??
                                    '----',
                              ),
                              CardDisplayInfoStoreData(
                                title: "رقم شهادة العمل الحر",
                                value:
                                    storeData
                                        .storeCredential
                                        ?.numberFreelance ??
                                    '----',
                              ),
                              CardDisplayInfoStoreData(
                                title: "تاريخ شهادة العمل الحر",
                                value:
                                    storeData
                                        .storeCredential
                                        ?.expiryDateFreelance ??
                                    '----',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // height: 0.30.sh,
                      width: 1.sh,
                      constraints: BoxConstraints(
                        maxHeight: 400,
                        maxWidth: 400,
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("العوائد و المدفوعات"),
                                Text("التفاصيل"),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 400,
                                maxWidth: 400,
                              ),
                              child: PieChart(
                                PieChartData(
                                  pieTouchData: PieTouchData(),
                                  startDegreeOffset: -90,

                                  sections: [
                                    PieChartSectionData(
                                      value:
                                          (revenuesPaymentsStore.storeProfit ??
                                                  0)
                                              .toDouble(),

                                      color: Colors.blue,
                                      radius: 100,
                                    ),
                                    PieChartSectionData(
                                      value:
                                          (revenuesPaymentsStore
                                                      .maamoulProfit ??
                                                  0)
                                              .toDouble(),

                                      color: Colors.red,
                                      radius: 100,
                                    ),
                                  ],
                                  borderData: FlBorderData(show: false),

                                  sectionsSpace: 1,
                                  centerSpaceRadius: 0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("عوائد معمول"),
                                      Text(
                                        "\$${revenuesPaymentsStore.maamoulProfit}",
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("مدفوعات المتجر"),
                                      Text(
                                        "\$${revenuesPaymentsStore.storeProfit}",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text("4.5", style: TextStyle(fontWeight: FontWeight.w900)),
                    Icon(Icons.star, color: Colors.amberAccent),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardSelectRadio extends StatelessWidget {
  const CardSelectRadio({
    super.key,
    required this.title,
    required this.value,
    this.onChanged,
    required this.groupValue,
  });
  final String title;
  final SelectType value;
  final SelectType groupValue;
  final Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (value) {
              if (onChanged != null) {
                onChanged!();
              }
            },
          ),
        ],
      ),
    );
  }
}
