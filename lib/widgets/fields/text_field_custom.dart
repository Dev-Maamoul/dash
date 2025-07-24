import 'package:dashboard/shared/constants/colors_app.dart';
import 'package:dashboard/shared/constants/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({super.key, this.controller, this.label, this.hint});
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        double? font = 5.sp;
        switch (font) {
          case <= 18:
            font = 18;
          case >= 22:
            font = 22;

            break;
          default:
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label ?? "Email",
              style: TextStyle(fontSize: font, fontWeight: FontWeight.w700),
            ),
            SpaceCustom.spaceHight(
              height: 0.015.sw,
              constraints: BoxConstraints(maxHeight: 8),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 500, maxHeight: 50),

              height: .05.sw,
              child: TextField(
                controller: controller,
                cursorHeight: font,
                style: TextStyle(
                  fontSize: font,
                  height: 0.04.sp,
                  color: Colors.black,
                ),
                onTapUpOutside: (event) => true,
                decoration: InputDecoration(
                  filled: true,
                  hintText: hint ?? 'Enter Email',
                  hintStyle: TextStyle(fontSize: font),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: ColorsApp.systemGreen),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: ColorsApp.systemGreen,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: ColorsApp.systemGreen),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
