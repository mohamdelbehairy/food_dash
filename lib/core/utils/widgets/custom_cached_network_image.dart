import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_dash/core/models/cached_network_image_model.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {super.key, required this.cachedNetworkImageModel});
  final CachedNetworkImageModel cachedNetworkImageModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(cachedNetworkImageModel.borderRadius ?? 0),
      child: CachedNetworkImage(
        fit: cachedNetworkImageModel.fit,
        imageUrl: cachedNetworkImageModel.imageUrl,
        height: cachedNetworkImageModel.height,
        width: cachedNetworkImageModel.width,
        placeholder: (context, url) =>
            cachedNetworkImageModel.placeholder != null
                ? cachedNetworkImageModel.placeholder!
                : SizedBox(),
      ),
    );
  }
}

