import 'package:flutter/material.dart';
import '../widgets/phone_number_view_body.dart';

class PhoneNumberView extends StatelessWidget {
  const PhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      body: PhoneNumberViewBody(size: size),
    );
  }
}
