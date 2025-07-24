import 'package:flutter/material.dart';

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({
    required this.child,
    required this.message,
    this.show = true,
    super.key,
  });
  final Widget child;
  final bool show;
  final String message;
  @override
  Widget build(BuildContext context) => show
      ? Directionality(
          textDirection: TextDirection.ltr,
          child: Banner(
            location: BannerLocation.topStart,
            message: message,
            color: Colors.green.withOpacity(0.6),
            textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                letterSpacing: 1.0),
            textDirection: TextDirection.ltr,
            child: child,
          ),
        )
      : child;
}
