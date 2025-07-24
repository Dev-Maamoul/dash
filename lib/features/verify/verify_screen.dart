import 'package:dashboard/features/login/login_screen.dart';
import 'package:dashboard/features/verify/cubit/verify_cubit.dart';
import 'package:dashboard/shared/constants/colors_app.dart';
import 'package:dashboard/shared/constants/spacer.dart';
import 'package:dashboard/shared/routes/route_generator.dart';
import 'package:dashboard/widgets/buttons/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<VerifyCubit>();
          return BlocListener<VerifyCubit, VerifyState>(
            listener: (context, state) {
              if (state is BackState) {
                context.go(Routes.login);
              }
              if (state is VerifyLoading) {
                LoadingWidget.show(context: context);
              } else {
                LoadingWidget.close(context: context);
              }
              if (state is VerifySuccess) {
                context.go(Routes.menu);
              }
              if (state is VerifyError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.msg)));
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
                                        Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Pinput(
                                            length: 6,
                                            defaultPinTheme: PinTheme(
                                              width: 30.w,
                                              height: 25.w,
                                              constraints: BoxConstraints(
                                                maxHeight: 65,
                                                maxWidth: 80,
                                              ),
                                              textStyle: TextStyle(
                                                fontSize: 20,
                                                color: ColorsApp.systemGreen,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: ColorsApp.systemGreen,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            onCompleted: (pin) async {
                                              await Future.delayed(
                                                const Duration(
                                                  milliseconds: 50,
                                                ),
                                              );
                                              cubit.enableButton(otpCode: pin);
                                            },

                                            onChanged: (value) {
                                              // if (state is EnableUpdate) {
                                              //   cubit.enableButton(
                                              //     otpCode: value,
                                              //   );
                                              // }
                                            },
                                          ),
                                        ),
                                        SpaceCustom.spaceHight(
                                          height: 0.015.sw,
                                          constraints: BoxConstraints(
                                            maxHeight: 16,
                                          ),
                                        ),
                                        BlocBuilder<VerifyCubit, VerifyState>(
                                          builder: (context, state) {
                                            return ButtonCustom(
                                              title: "تحقق",
                                              width: 30.sw,

                                              onPressed: !cubit.isEnable
                                                  ? null
                                                  : () async {
                                                      await cubit.verify();
                                                    },
                                            );
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
