import 'package:flutter/material.dart';

import '../app_details/app_styles.dart';

AppBar customAppbar({required String appBarText, double? titleSpacing}) {
  return AppBar(
      titleSpacing: titleSpacing ?? -4,
      title: Text(appBarText, style: AppStyles.styleAppBar));
}
