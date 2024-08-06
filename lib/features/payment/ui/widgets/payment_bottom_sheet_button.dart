import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/features/payment/logic/paymob_payment/paymob_payment_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/widgets/custom_button_item.dart';
import '../../logic/pay_with_paymob.dart';
import '../../logic/pay_with_strip.dart';
import '../../logic/paypal_payment.dart';

class PaymentBottomSheetButton extends StatelessWidget {
  const PaymentBottomSheetButton({super.key, required this.activeIndex});
  final int activeIndex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymobPaymentCubit, PaymobPaymentState>(
      listener: (context, state) {
        if (state is PaymobPaymentSuccess) {
          GoRouter.of(context).push(AppRouter.paymobView);
        }
      },
      child: CustomButtonItem(
          size: MediaQuery.sizeOf(context),
          buttonName: 'Pay',
          onTap: () async {
            if (activeIndex == 0) {
              await payWithStrip(context);
            } else if (activeIndex == 1) {
              PaypalPayment.payWithPayPal(context);
            } else {
              await payWithPaymob(context);
            }
          }),
    );
  }
}
