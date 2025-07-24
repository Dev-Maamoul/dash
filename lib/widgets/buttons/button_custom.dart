import 'package:dashboard/shared/constants/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    this.onPressed,
    this.title = "Login",
    this.colorBg,
    this.width,
  });

  final Function()? onPressed;
  final String? title;
  final Color? colorBg;
  final double? width;

  @override
  Widget build(BuildContext context) {
    // ✅ تأكد أن maxWidth أكبر من 100
    double? font = 5.sp;
    switch (font) {
      case <= 18:
        font = 14;
      case >= 22:
        font = 18;

        break;
      default:
    }
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorBg ?? ColorsApp.systemGreen,
          foregroundColor: const Color.fromARGB(255, 5, 0, 0),
          minimumSize: Size(width ?? 100, 35),
          fixedSize: Size(30.sw, 35),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        child: Text(
          title ?? "Login",
          style: TextStyle(fontSize: font, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
