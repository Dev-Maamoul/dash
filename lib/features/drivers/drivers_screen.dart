import 'package:dashboard/features/home/home_screen.dart';
import 'package:dashboard/features/stores/stores/stores_screen.dart';
import 'package:dashboard/shared/data_source/dataLocater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class DriversScreen extends StatelessWidget {
  const DriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "المناديب",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  HomeCardSearch(),
                ],
              ),

              SizedBox(height: 16),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 0.77.sh,
                      constraints: BoxConstraints(minHeight: 400),

                      // color: Colors.white,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _calculateCrossAxisCount(context),
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: _calculateChildAspectRatio(context),
                        ),
                        itemCount: GetIt.I.get<DataLocater>().drivers.length,
                        itemBuilder: (context, index) => Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 150,
                              maxWidth: 500,
                            ),

                            child: CardDisplayAccount(
                              name:
                                  GetIt.I
                                      .get<DataLocater>()
                                      .drivers[index]
                                      .personInfo
                                      ?.name ??
                                  '------',
                              subtitle1:
                                  GetIt.I
                                      .get<DataLocater>()
                                      .drivers[index]
                                      .personInfo
                                      ?.identity
                                      ?.idNumber ??
                                  "------",
                              subtitle2:
                                  GetIt.I
                                      .get<DataLocater>()
                                      .drivers[index]
                                      ?.personInfo
                                      ?.mobile ??
                                  '-----',
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    print(width);
    if (width <= 900) return 2;
    if (width <= 1050) return 3;
    if (width < 1300) return 4;

    return 4;
  }

  double _calculateChildAspectRatio(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    print(width);
    if (width < 900) return 7 / 1.6;
    if (width < 1050) return 7 / 2.5;
    if (width < 1200) return 7 / 2.4;
    if (width < 1400) return 7 / 2.3;

    return 7 / 1.8;
  }
}
