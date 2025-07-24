import 'package:cached_network_image/cached_network_image.dart';
import 'package:dashboard/shared/constants/colors_app.dart';
import 'package:flutter/material.dart';

class ImageStoreWidget extends StatelessWidget {
  const ImageStoreWidget({super.key, this.imageURL, this.shape, this.size});
  final String? imageURL;
  final BoxShape? shape;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 150,
      width: size ?? 150,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsApp.systemGreen,
          width: 2,
          strokeAlign: 1,
        ),
        boxShadow: kElevationToShadow[2],
        shape: shape ?? BoxShape.circle,
      ),
      child: FittedBox(
        fit: BoxFit.cover,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        child: CachedNetworkImage(
          imageUrl:
              imageURL ??
              "https://qyueoxzxneyaljhrqewl.supabase.co/storage/v1/object/public/account//logo.png",
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}
