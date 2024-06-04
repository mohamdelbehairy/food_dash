import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/verification_view_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.grey.withOpacity(.010),
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarColor: Colors.black,
                  systemNavigationBarIconBrightness: Brightness.dark)),
          body: VerificationViewBody(size: size)),
    );
  }
}
