import 'package:flutter/material.dart';

import '../../../../core/models/cached_network_image_model.dart';
import '../../../../core/utils/widgets/custom_cached_network_image.dart';
import '../../../../core/utils/widgets/custom_fading_widget.dart';

class DiscountCategoryImage extends StatelessWidget {
  const DiscountCategoryImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
        cachedNetworkImageModel: CachedNetworkImageModel(
            imageUrl: image,
            borderRadius: 25,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: CustomFadingWidget(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            )));
  }
}
