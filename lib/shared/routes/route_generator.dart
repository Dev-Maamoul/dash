import 'package:dashboard/features/display_orders/display_orders.dart';
import 'package:dashboard/features/users/display_user/display_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:dashboard/features/stores/display_store/display_store_screen.dart';
import 'package:dashboard/features/drivers/drivers_screen.dart';
import 'package:dashboard/features/home/home_screen.dart';
import 'package:dashboard/features/login/login_screen.dart';
import 'package:dashboard/features/menu/menu_screen.dart';
import 'package:dashboard/features/verify/verify_screen.dart';
import 'package:dashboard/shared/data_source/auth_locater.dart';
import 'package:dashboard/shared/models/all_stores_model.dart';
import 'package:dashboard/my_app.dart';

class Routes {
  // route names
  static const init = '/';
  static const login = '/auth/login';
  static const verifyLogin = '/auth/verifyLogin';
  static const menu = '/menu';
  static const home = '/menu/home';
  static const storeDisplay = '/menu/store/display';
  static const ordersStore = '/menu/orders/store';
  static const users = '/menu/user/users';
  static const drivers = '/menu/drivers';
  static const ordersDisplay = '/menu/orders/order';
}

abstract class RouteConfigure {
  static final _auth = GetIt.I<AuthLocater>();

  static final GoRouter routeConfig = GoRouter(
    routes: [
      /// Initial loading
      GoRoute(path: Routes.init, builder: (_, _) => const LoadingScreen()),

      /// Auth routes
      GoRoute(
        path: '/auth',
        builder: (_, _) =>
            const Scaffold(body: Center(child: CircularProgressIndicator())),
        routes: [
          GoRoute(
            path: 'login',
            redirect: (_, _) =>
                _auth.verifyData?.token != null ? Routes.menu : null,
            builder: (_, _) => const LoginScreen(),
          ),
          GoRoute(
            path: 'verifyLogin',
            redirect: (_, _) =>
                _auth.verifyData?.token != null ? Routes.menu : null,
            builder: (_, _) => const VerifyScreen(),
          ),
        ],
      ),

      /// Main dashboard (protected)
      GoRoute(
        path: Routes.menu,
        redirect: (_, _) =>
            _auth.verifyData?.token == null ? Routes.login : null,
        builder: (_, _) => const MenuDashboard(),
        routes: [
          GoRoute(path: 'home', builder: (_, _) => const HomeScreen()),
          GoRoute(
            path: 'store/display',
            redirect: (_, state) =>
                state.extra is! StoreModel ? Routes.menu : null,
            builder: (_, _) => const DisplayScreenStore(),
          ),
          GoRoute(
            path: 'orders/order',
            builder: (_, _) => const DisplayOrders(),
          ),
          GoRoute(
            path: 'user/users',
            builder: (_, _) => const DisplayUserScreen(),
          ),
          GoRoute(path: 'drivers', builder: (_, _) => const DriversScreen()),
        ],
      ),
    ],
  );
}
