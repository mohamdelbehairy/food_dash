  import 'package:flutter/material.dart';

import '../app_styles.dart';

AppBar customAppbar({required String appBarText}) {
    return AppBar(
      titleSpacing: -4,
      title: Text(appBarText, style: AppStyles.styleAppBar),
    );
  }