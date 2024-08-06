import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_dash/features/payment/model/payment_bottom_model.dart';

class PaymentBottomSheetItem extends StatelessWidget {
  const PaymentBottomSheetItem({super.key, required this.paymentBottomModel});

  final PaymentBottomModel paymentBottomModel;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 62,
      width: 103,
      decoration: BoxDecoration(
          color: Color(0xff34A853),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              width: 1.5,
              color: paymentBottomModel.isActive
                  ? Color(0xff34A853)
                  : Colors.grey),
          boxShadow: [
            BoxShadow(
                blurRadius: 4.0,
                spreadRadius: 0.0,
                offset: const Offset(0, 0),
                color: paymentBottomModel.isActive
                    ? const Color(0xff34A853)
                    : Colors.white)
          ]),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: SvgPicture.asset(paymentBottomModel.image,
                  height: paymentBottomModel.index ? 20 : 30,
                  fit: BoxFit.scaleDown))),
    );
  }
}
