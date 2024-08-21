import 'package:flutter/material.dart';

class CachedNetworkImageModel {
  final String imageUrl;
  final double? height, width,borderRadius;
  final Widget? placeholder;
 
  final BoxFit? fit;

  CachedNetworkImageModel(
      {required this.imageUrl,
      this.height,
      this.width,
      this.placeholder,
      this.borderRadius,
      this.fit});
}
