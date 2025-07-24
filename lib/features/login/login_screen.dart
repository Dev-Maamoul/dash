import 'package:dashboard/features/login/cubit/login_cubit.dart';
import 'package:dashboard/shared/constants/colors_app.dart';
import 'package:dashboard/shared/constants/spacer.dart';
import 'package:dashboard/shared/routes/route_generator.dart';
import 'package:dashboard/widgets/buttons/button_custom.dart';
import 'package:dashboard/widgets/fields/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<LoginCubit>();

          return BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                LoadingWidget.show(context: context);
              } else {
                LoadingWidget.close(context: context);
              }
              if (state is LoginSuccess) {
                context.go(Routes.verifyLogin);
              }
            },
            child: Scaffold(
              body: SizedBox(
                height: 1.sh,
                width: 1.sw,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 0.35.sh,
                        width: 100.sw,
                        color: ColorsApp.systemGreen.withAlpha(50),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                height: .5.sh,
                                width: 0.3.sw,
                                constraints: BoxConstraints(
                                  maxHeight: 500,
                                  maxWidth: 500,
                                ),
                                child: FittedBox(
                                  child: Image.asset(
                                    'assets/Rectangle 2294.png',
                                    height: 0.5.sw,
                                    width: 0.5.sw,
                                    fit: BoxFit.cover,
                                    // scale: 0.6.w,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxHeight: 450,
                                  maxWidth: 500,
                                ),

                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LogoImage(),
                                    SpaceCustom.spaceHight(
                                      height: 0.015.sw,
                                      constraints: BoxConstraints(
                                        maxHeight: 16,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        TextFieldCustom(
                                          label: "رقم الجوال",
                                          hint: "ادخل ادخل رقم جوالك ",
                                          controller: cubit.mobileController,
                                        ),
                                        SpaceCustom.spaceHight(
                                          height: 0.015.sw,
                                          constraints: BoxConstraints(
                                            maxHeight: 16,
                                          ),
                                        ),
                                        ButtonCustom(
                                          title: "تسجيل الدخول",
                                          width: 30.sw,
                                          onPressed: () async {
                                            await cubit.login();
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

//-------

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 200,
        maxWidth: 200,
        minHeight: 150,
        minWidth: 150,
      ),
      child: Image.asset(
        'assets/logo.png',
        height: 30.w,
        width: 30.w,
        fit: BoxFit.fill,
        // scale: 1.sw,
      ),
    );
  }
}

class LoadingWidget {
  static final _key = GlobalKey();
  static void close({required BuildContext context}) {
    if (_key.currentContext?.mounted == true) {
      context.pop();
    }
  }

  static void show({required BuildContext context, String? message}) {
    showDialog(
      context: context,

      barrierDismissible: false, // يمنع الإغلاق عند الضغط خارج النافذة
      barrierColor: Colors.transparent,

      builder: (context) {
        return Dialog(
          key: _key,
          backgroundColor: Colors.blueGrey.withAlpha(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Spinner
                SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(
                    strokeWidth: 20,

                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorsApp.systemGreen,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Optional message
                Text(
                  message ?? 'جاري التحميل...',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
