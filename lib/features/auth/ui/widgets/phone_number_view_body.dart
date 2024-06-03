import 'package:flutter/material.dart';

import 'phone_number_section.dart';

class PhoneNumberViewBody extends StatefulWidget {
  const PhoneNumberViewBody({super.key, required this.size});
  final Size size;

  @override
  State<PhoneNumberViewBody> createState() => _PhoneNumberViewBodyState();
}

class _PhoneNumberViewBodyState extends State<PhoneNumberViewBody> {
  bool isValue = false;

  TextEditingController controller = TextEditingController();
  
  String number = '';
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 24),
        physics: const NeverScrollableScrollPhysics(),
        child: PhoneNumberSection(
            number: number,
            size: widget.size,
            isValue: isValue,
            controller: controller,
            onChangedPhoneNumber: (phoneNumber) {
              setState(() {
                isValue = phoneNumber.number.isNotEmpty;
                number = phoneNumber.completeNumber;
              });

              debugPrint('number: $number');
            }),
      ),
    );
  }
}
