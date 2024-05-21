import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/components/custom_app_bar.dart';

import '../widgets/user_data_view_body.dart';

class UserDataView extends StatelessWidget {
  const UserDataView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: customAppbar(appBarText: 'Fill Your Profile'),
        body: UserDataViewBody(size: size));
  }
}
