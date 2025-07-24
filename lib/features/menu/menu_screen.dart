import 'package:dashboard/features/home/home_screen.dart';
import 'package:dashboard/features/login/login_screen.dart';
import 'package:dashboard/features/menu/cubit/menu_cubit.dart';
import 'package:dashboard/features/stores/stores/stores_screen.dart';
import 'package:dashboard/features/users/users/users_screen.dart';
import 'package:dashboard/shared/constants/colors_app.dart';
import 'package:dashboard/shared/data_source/auth_locater.dart';
import 'package:dashboard/shared/routes/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class MenuDashboard extends StatelessWidget {
  const MenuDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<MenuCubit>();
          cubit.loadData();

          return Scaffold(
            body: BlocBuilder<MenuCubit, MenuState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is ErrorState) {
                  return Center(child: Text(state.msg));
                }
                return Center(
                  child: Row(
                    children: [
                      Container(
                        height: 100.sh,
                        width: 0.25.sw,
                        color: Colors.white,
                        constraints: BoxConstraints(
                          maxWidth: 200,
                          minWidth: 200,
                        ),
                        child: Column(
                          children: [
                            LogoImage(),
                            ListTile(
                              leadingAndTrailingTextStyle: TextStyle(),
                              title: Center(child: Text("محمد خالد")),
                              subtitle: Center(child: Text("user@gmail.com")),
                            ),
                            ListTile(
                              title: Text(
                                "الصفحة الرئيسية",
                                style: TextStyle(
                                  fontWeight: cubit.selectIndex == 0
                                      ? FontWeight.bold
                                      : null,
                                ),
                              ),
                              onTap: () {
                                cubit.changePage(index: 0);
                              },
                              leading: Icon(
                                Icons.home,
                                size: cubit.selectIndex == 0 ? 30 : 23,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "المتاجر",
                                style: TextStyle(
                                  fontWeight: cubit.selectIndex == 1
                                      ? FontWeight.bold
                                      : null,
                                ),
                              ),
                              onTap: () {
                                cubit.changePage(index: 1);
                              },
                              leading: Icon(
                                Icons.home,
                                size: cubit.selectIndex == 1 ? 20 : 23,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "العملاء",
                                style: TextStyle(
                                  fontWeight: cubit.selectIndex == 2
                                      ? FontWeight.bold
                                      : null,
                                ),
                              ),
                              onTap: () {
                                cubit.changePage(index: 2);
                              },
                              leading: Icon(
                                Icons.home,
                                size: cubit.selectIndex == 2 ? 20 : 23,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "المناديب",
                                style: TextStyle(
                                  fontWeight: cubit.selectIndex == 3
                                      ? FontWeight.bold
                                      : null,
                                ),
                              ),
                              onTap: () {
                                cubit.changePage(index: 3);
                              },
                              leading: Icon(
                                Icons.home,
                                size: cubit.selectIndex == 3 ? 20 : 23,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "الطلبات",
                                style: TextStyle(
                                  fontWeight: cubit.selectIndex == 4
                                      ? FontWeight.bold
                                      : null,
                                ),
                              ),
                              onTap: () {
                                cubit.changePage(index: 4);
                              },
                              leading: Icon(
                                Icons.home,
                                size: cubit.selectIndex == 4 ? 20 : 23,
                              ),
                            ),
                            ListTile(
                              textColor: Colors.red,
                              title: Text(
                                "تسجيل الخروج",
                                style: TextStyle(
                                  fontWeight: cubit.selectIndex == 2
                                      ? FontWeight.bold
                                      : null,
                                ),
                              ),
                              onTap: () async {
                                final authLocater = GetIt.I.get<AuthLocater>();
                                await authLocater.clear();
                                context.go(Routes.init);
                              },
                              leading: Icon(
                                Icons.logout,
                                size: cubit.selectIndex == 2 ? 20 : 23,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 100.w,
                          color: ColorsApp.systemBackground,
                          child: Builder(
                            builder: (context) =>
                                cubit.views[cubit.selectIndex],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
