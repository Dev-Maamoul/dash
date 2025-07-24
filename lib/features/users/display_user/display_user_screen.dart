import 'dart:math';

import 'package:dashboard/shared/routes/route_generator.dart';
import 'package:dashboard/widgets/table_order_widget.dart';
import 'package:dashboard/features/users/display_user/cubit/user_display_cubit.dart';
import 'package:dashboard/shared/data_source/dataLocater.dart';
import 'package:dashboard/shared/models/users_model.dart';
import 'package:dashboard/shared/widgets/image_store_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';

class DisplayUserScreen extends StatelessWidget {
  const DisplayUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDisplayCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<UserDisplayCubit>();
          cubit.user = GoRouterState.of(context).extra as UserModel?;
          cubit.loadOrders();

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 0.90.sh,
                        width: 0.70.sw,
                        color: Colors.white,
                        child: SizedBox(
                          height: 0.90.sh,
                          child:
                              BlocBuilder<UserDisplayCubit, UserDisplayState>(
                                builder: (context, state) {
                                  if (state is LoadOrdersSuccess) {
                                    return TableOrdersWidget(
                                      orders: cubit.orders,
                                      onChanged: (p0) {
                                        context.go(
                                          Routes.ordersDisplay,
                                          extra: p0,
                                        );
                                      },
                                    );
                                  }
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Column(
                      children: [
                        Container(
                          // height: 0.90.sh,
                          width: 0.20.sw,
                          padding: EdgeInsets.all(16),
                          constraints: BoxConstraints(minWidth: 250),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Column(
                            spacing: 8,
                            children: [
                              SizedBox(height: 16),
                              ImageStoreWidget(),
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "معلومات العميل",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              LabelInfo(
                                title: 'رقم العميل',
                                value: cubit.user?.id,
                              ),
                              LabelInfo(
                                title: 'اسم العميل',
                                value: cubit.user?.fullName,
                              ),
                              LabelInfo(
                                title: ' البريد الالكتروني',
                                value: cubit.user?.email,
                              ),
                              LabelInfo(
                                title: 'رقم الهاتف',
                                value: cubit.user?.mobile,
                              ),
                              LabelInfo(
                                title: 'الجنس',
                                value: cubit.user?.gender,
                              ),
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "معلومات العميل",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              LabelInfo(
                                title: 'حالة الحساب',
                                value: cubit.user?.accountStatus,
                              ),
                              LabelInfo(
                                title: 'تاريخ الانضمام',
                                value: cubit.user?.createdAt,
                              ),
                              LabelInfo(
                                title: 'اخر تحديث',
                                value: cubit.user?.updatedAt,
                              ),

                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          height: 400,
                          width: 400,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Column(
                            children: [
                              CharCustom(
                                values: [
                                  CharValue(title: "تم التوصيل", value: 100.0),
                                  CharValue(title: "تحت الاجراء", value: 50.0),
                                  CharValue(title: "ملغي", value: 25.0),
                                  CharValue(title: "في الانتظار", value: 25.0),
                                  CharValue(title: "في الطريق", value: 25.0),
                                  CharValue(title: "تم الشحن", value: 25.0),
                                  CharValue(title: "تم الدفع", value: 25.0),
                                  CharValue(title: "تم الاستلام", value: 25.0),
                                  CharValue(
                                    title: "بانتظار السائق",
                                    value: 25.0,
                                  ),
                                  CharValue(
                                    title: "بانتظار الدفع",
                                    value: 25.0,
                                  ),
                                ],
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
          );
        },
      ),
    );
  }
}

class LabelInfo extends StatelessWidget {
  const LabelInfo({super.key, required this.title, this.value});
  final String title;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            "$title :",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            value ?? "-----",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class CharCustom extends StatelessWidget {
  const CharCustom({super.key, required this.values});
  final List<CharValue> values;

  @override
  Widget build(BuildContext context) {
    List<Color> customColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.amber,
      Colors.cyan,
      Colors.indigo,
      Colors.lime,
      Colors.pink,
      Colors.brown,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.lightBlue,
    ];

    return Column(
      children: [
        EasyPieChart(
          // borderWidth: 10,
          borderEdge: StrokeCap.square,
          // centerText: 'data',
          animateFromEnd: true,
          showValue: true,
          size: 200,
          start: 100,
          shouldAnimate: true,
          pieType: PieType.fill,
          gap: 0,

          centerStyle: TextStyle(fontSize: 10, color: Colors.black),
          children: List.generate(
            values.length,
            (index) => PieData(
              value: values[index].value.toDouble(),
              color: index >= customColors.length
                  ? Color.fromARGB(
                      255, // الشفافية (ثابتة: غير شفافة)
                      Random().nextInt(256), // R
                      Random().nextInt(256), // G
                      Random().nextInt(256), // B
                    )
                  : customColors[index],
            ),
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 2,
          runSpacing: 2,

          children: [
            ...List.generate(
              values.length,
              (index) => SizedBox(
                width: 150,
                child: Row(
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      color: index >= customColors.length
                          ? Color.fromARGB(
                              255, // الشفافية (ثابتة: غير شفافة)
                              Random().nextInt(256), // R
                              Random().nextInt(256), // G
                              Random().nextInt(256), // B
                            )
                          : customColors[index],
                    ),
                    SizedBox(width: 8),
                    Text(values[index].title),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CharValue {
  final String title;
  final num value;

  CharValue({required this.title, required this.value});
}
