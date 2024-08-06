import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/paymob_models/make_payment_model.dart';
import 'paymob_payment/paymob_payment_cubit.dart';

Future<void> payWithPaymob(BuildContext context) async {
  await BlocProvider.of<PaymobPaymentCubit>(context).makePayment(
      makePaymentModel: MakePaymentModel(
          price: "11500", firstName: "Mohamed", lastName: "Elbehairy"));
}