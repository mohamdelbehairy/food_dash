  import 'package:flutter/material.dart';

import '../../logic/remember_me/remember_me_cubit.dart';

AppBar authAppBar(BuildContext context, RememberMeCubit isClick) {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            if (isClick.isClick) {
              isClick.rememberMe();
            }
          },
          child: Icon(Icons.arrow_back)),
    );
  }