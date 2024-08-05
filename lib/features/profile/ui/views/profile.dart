import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/payment/logic/strip_payment/strip_payment_cubit.dart';
import 'package:food_dash/features/payment/model/strip_models/payment_input_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () async {
            await BlocProvider.of<StripPaymentCubit>(context).makePayment(
                paymentInputModel: PaymentInputModel(
                    amount: "1500",
                    currency: "USD",
                    customerID: FirebaseAuth.instance.currentUser!.uid));
          },
          icon: Icon(Icons.edit),
        ),
      ]),
    );
  }
}
