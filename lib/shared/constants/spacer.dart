import 'package:flutter/widgets.dart';

abstract class SpaceCustom {
  static Widget spaceHight({double? height, BoxConstraints? constraints}) {
    return ConstrainedBox(
      constraints:
          constraints ??
          BoxConstraints(
            maxHeight: height!,
            maxWidth: (height * 8),
            minHeight: height,
            minWidth: (height * 8),
          ),
      child: SizedBox(height: height),
    );
  }

  static Widget spaceWidth({double? width, BoxConstraints? constraints}) {
    return ConstrainedBox(
      constraints:
          constraints ??
          BoxConstraints(
            maxHeight: width!,
            maxWidth: (width * 8),
            minHeight: width,
            minWidth: (width * 8),
          ),
      child: SizedBox(width: width ?? 8),
    );
  }
}
