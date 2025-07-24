import 'package:dashboard/features/login/login_screen.dart';
import 'package:dashboard/features/menu/cubit/menu_cubit.dart';
import 'package:dashboard/shared/constants/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MenuCubit>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الصفحة الرئيسية",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                HomeCardSearch(),
              ],
            ),
            SizedBox(height: 8),
            HomeSalesCard(
              onPressedRefresh: () {
                cubit.loadData();
              },
              ordersCount: (cubit.authLocater.analysesData?.orders.all ?? 0)
                  .toString(),
              storesCount: (cubit.authLocater.analysesData?.store.all ?? 0)
                  .toString(),
              clintCount: (cubit.authLocater.analysesData?.users.all ?? 0)
                  .toString(),
              profit: (cubit.authLocater.analysesData?.profit.totalProfit ?? 0)
                  .toString(),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeSalesCard extends StatelessWidget {
  const HomeSalesCard({
    super.key,
    required this.ordersCount,
    required this.storesCount,
    required this.clintCount,
    required this.profit,
    this.onPressedRefresh,
  });
  final String ordersCount;
  final String storesCount;
  final String clintCount;
  final String profit;
  final Function()? onPressedRefresh;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "المبيعات",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "ملخص المبيعات",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: onPressedRefresh,
                icon: Icon(Icons.refresh),
              ),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              CardHomeInfo(
                title: 'إجمالي الطلبات',
                value: ordersCount,
                assetsPath:
                    'assets/svg/material-symbols-light_orders-outline.svg',
              ),
              CardHomeInfo(
                title: 'عدد المتاجر',
                value: storesCount,
                assetsPath: 'assets/svg/weui_shop-outlined.svg',
              ),
              CardHomeInfo(
                title: 'عدد العملاء',
                value: clintCount,
                assetsPath: 'assets/svg/ph_users-three-light.svg',
              ),
              CardHomeInfo(
                title: 'إجمالي الإرادات',
                value: profit,
                assetsPath: 'assets/svg/icon-park-outline_sales-report.svg',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardHomeInfo extends StatelessWidget {
  const CardHomeInfo({
    super.key,
    required this.title,
    this.value,
    this.assetsPath,
    this.onTap,
  });
  final String title;
  final String? value;
  final String? assetsPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 0.09.sw,
        width: 0.15.sw,
        padding: EdgeInsets.all(16),
        constraints: BoxConstraints(
          maxWidth: 400,
          minWidth: 100,
          maxHeight: 100,
          minHeight: 50,
        ),
        decoration: BoxDecoration(
          color: ColorsApp.systemGreen.withAlpha(20),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,

              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 3.sp > 10 ? 12 : 3.sp,
                      fontWeight: value == null
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: ColorsApp.systemFontGrey,
                    ),
                  ),
                  if (value != null)
                    Expanded(
                      child: Text(
                        value!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 3.sp > 8 ? 10 : 3.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Flexible(
              child: Center(
                child: Container(
                  height: 0.09.sw,
                  width: 0.09.sw,
                  padding: EdgeInsets.all(8),
                  constraints: BoxConstraints(
                    maxWidth: 70,
                    minWidth: 70,
                    maxHeight: 120,
                    minHeight: 120,
                  ),
                  decoration: BoxDecoration(
                    color: ColorsApp.systemGreen.withAlpha(65),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FittedBox(
                    child: SvgPicture.asset(
                      // fit: BoxFit.fitHeight,
                      assetsPath ?? 'assets/svg/Group.svg',
                      semanticsLabel: 'Dart Logo',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//----
class HomeCardSearch extends StatelessWidget {
  const HomeCardSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchWidget(),

          CircleImageButton(onTap: () {}),
          CircleImageButton(),
          CircleImageButton(),
        ],
      ),
    );
  }
}

//---
class CircleImageButton extends StatelessWidget {
  const CircleImageButton({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: ColorsApp.systemBackgroundContainer,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(8),
        child: SvgPicture.asset(
          'assets/svg/Group.svg',
          semanticsLabel: 'Dart Logo',
        ),
      ),
    );
  }
}

//---
class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.width, this.height});
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 180,
      height: height ?? 35,
      child: SearchBar(
        leading: Icon(
          Icons.search,
          color: Colors.black,
          size: (height ?? 180) / 10,
        ),
        backgroundColor: WidgetStateProperty.all(
          ColorsApp.systemBackgroundContainer,
        ),

        hintText: "أبحث",
        elevation: WidgetStatePropertyAll(0),
        overlayColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(180),
            side: BorderSide(
              color: ColorsApp.systemBackgroundContainer,
              width: 2,
            ),
          ),
        ),
        hintStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 4.sp > 16 ? 12 : 4.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
