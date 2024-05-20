import 'package:flutter/material.dart';

import '../../../../core/utils/components/custom_app_bar.dart';
import '../widgets/opt_phone_number_view_body.dart';

class OptPhoneNumberView extends StatelessWidget {
  const OptPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: customAppbar(appBarText: 'OPT Code Verification'),
        body: OptPhoneNumberViewBody(size: size));
  }
}
