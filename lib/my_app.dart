import 'dart:ui';

import 'package:dashboard/shared/constants/colors_app.dart';
import 'package:dashboard/shared/routes/route_generator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'dart:html' as html;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          theme: ThemeData(fontFamily: 'Inter'),
          debugShowCheckedModeBanner: false,
          locale: Locale('ar'),
          routerConfig: RouteConfigure.routeConfig,
          builder: (context, child) {
            final width = MediaQuery.sizeOf(context).width;
            final height = MediaQuery.sizeOf(context).height;
            if (height < 750) {
              return MyWidget();
            }
            if (width < 750) {
              return MyWidget();
            }
            return child!;
          },
        );
      },
    );
  }
}

void preventBackNavigation() {
  html.window.history.pushState(null, '', html.window.location.href);
  html.window.onPopState.listen((event) {
    html.window.history.pushState(null, '', html.window.location.href);
  });
}

///
///
///
///
///
///
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cccc) {
        return Scaffold(
          body: Center(
            child: ElevatedButton(
              onPressed: () {
                context.go('/auth/login');
              },
              child: Text("data"),
            ),
          ),
        );
      },
    );
  }
}

//----

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsApp.systemGreen,
              ColorsApp.systemGreen,
              ColorsApp.systemGreen,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 48.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white24, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.screen_rotation, color: Colors.amber, size: 80),
                SizedBox(height: 24),
                Text(
                  'عرض الشاشة غير مدعوم',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'يرجى استخدام جهاز بشاشة أعرض أو توسيع نافذة المتصفح للحصول على أفضل تجربة.',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
