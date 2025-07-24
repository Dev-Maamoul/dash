import 'package:dashboard/features/home/home_screen.dart';
import 'package:dashboard/features/stores/display_store/display_store_screen.dart';
import 'package:dashboard/shared/models/order_model.dart';
import 'package:dashboard/shared/widgets/image_store_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DisplayOrders extends StatelessWidget {
  const DisplayOrders({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersModel? storeData = GoRouterState.of(context).extra as OrdersModel;
    if (storeData == null) {
      return Scaffold(body: Center(child: Text("no orders")));
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("طلب رقم : ${storeData.id}"),
              Row(
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        return Column(
                          spacing: 10,
                          children: [
                            ...storeData.products
                                .map(
                                  (item) => Container(
                                    height: 100,
                                    width: 0.30.sw,
                                    constraints: BoxConstraints(
                                      maxWidth: 200,
                                      maxHeight: 100,
                                    ),
                                    color: Colors.amber,
                                    child: Row(
                                      children: [
                                        Image.network(item.imageUrl),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text("dddddd"),
                                              Text("dddddd"),
                                              Text("dddddd"),
                                              Text("dddddd"),
                                              Text("dddddd"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 0.9.sh,
                    width: 0.30.sw,
                    padding: EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ImageStoreWidget(
                                shape: BoxShape.rectangle,
                                size: 75,
                              ),
                              ImageStoreWidget(
                                shape: BoxShape.rectangle,
                                size: 75,
                              ),
                              ImageStoreWidget(
                                shape: BoxShape.rectangle,
                                size: 75,
                              ),
                            ],
                          ),
                          SizedBox(height: 30),

                          CardDataInfo(
                            dataView: [
                              DataCardDataInfo(
                                title: "السعر الاجمالي",
                                value: "204920 ريال",
                              ),
                              DataCardDataInfo(
                                title: "عدد المنتجات",
                                value: "50",
                              ),
                              DataCardDataInfo(
                                title: "حالة الطلب",
                                value: "منتهي",
                              ),
                              DataCardDataInfo(
                                title: "تاريخ الطلب",
                                value: "٢٠٢٠/١٠/١٠",
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: (0.30.sw) / 2.5,
                                child: CardDisplayInfoStore(
                                  title: "تفاصيل الطلب ",
                                  dataDisplay: [
                                    CardDisplayInfoStoreData(
                                      title: "وقت التحضير",
                                      value: '----',
                                    ),
                                    CardDisplayInfoStoreData(
                                      title: "المسافة",
                                      value: '----',
                                    ),
                                    CardDisplayInfoStoreData(
                                      title: "طريقة الدفع",
                                      value: '----',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: (0.30.sw) / 2.5,
                                child: CardDisplayInfoStore(
                                  title: "ملخص الطلب",
                                  dataDisplay: [
                                    CardDisplayInfoStoreData(
                                      title: "سعر المنتجات",
                                      value: '----',
                                    ),
                                    CardDisplayInfoStoreData(
                                      title: "الضريبة",
                                      value: '----',
                                    ),
                                    CardDisplayInfoStoreData(
                                      title: "رسوم التوصيل",
                                      value: '----',
                                    ),
                                    CardDisplayInfoStoreData(
                                      title: "الضريبة",
                                      value: '----',
                                    ),
                                    CardDisplayInfoStoreData(
                                      title: "رسوم السائق",
                                      value: '----',
                                    ),
                                    CardDisplayInfoStoreData(
                                      title: "كود الخصم",
                                      value: '----',
                                    ),
                                    CardDisplayInfoStoreData(
                                      title: "الخصم",
                                      value: '----',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
