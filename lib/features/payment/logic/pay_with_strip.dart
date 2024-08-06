import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'strip_payment/strip_payment_cubit.dart';
import '../model/strip_models/payment_input_model.dart';

Future<void> payWithStrip(BuildContext context) async {
  await BlocProvider.of<StripPaymentCubit>(context).makePayment(
      paymentInputModel: PaymentInputModel(
          amount: "150",
          currency: "USD",
          customerID: FirebaseAuth.instance.currentUser!.uid));
}
