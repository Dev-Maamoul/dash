import 'package:dashboard/features/home/home_screen.dart';
import 'package:dashboard/shared/routes/route_generator.dart';
import 'package:dashboard/widgets/table_order_widget.dart';
import 'package:dashboard/shared/data_source/dataLocater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("----------- ${GetIt.I.get<DataLocater>().orders.length}");
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الطلبات",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  HomeCardSearch(),
                ],
              ),

              SizedBox(height: 16),
              SizedBox(
                height: 0.87.sh,
                child: TableOrdersWidget(
                  orders: GetIt.I.get<DataLocater>().orders,
                  onChanged: (p0) {
                    context.go(Routes.ordersDisplay, extra: p0);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
