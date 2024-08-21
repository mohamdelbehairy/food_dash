import 'package:flutter/material.dart';

import '../../../../core/models/cached_network_image_model.dart';
import '../../../../core/models/user_data_model.dart';
import '../../../../core/utils/widgets/custom_cached_network_image.dart';
import 'profile_image_loading_indicator.dart';

class CustomProfileImage extends StatelessWidget {
  const CustomProfileImage({super.key, required this.userData});

  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return CustomCachedNetworkImage(
        cachedNetworkImageModel: CachedNetworkImageModel(
            imageUrl: userData.profileImage,
            height: 44,
            width: 44,
            borderRadius: 22,
            placeholder: ProfileImageLoadingIndicator()));
  }
}
