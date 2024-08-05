import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () async {
            // await BlocProvider.of<StripPaymentCubit>(context).makePayment(
            //     paymentInputModel: PaymentInputModel(
            //         amount: "1500",
            //         currency: "USD",
            //         customerID: FirebaseAuth.instance.currentUser!.uid));

            // PaypalPayment.payWithPayPal(context);
          },
          icon: Icon(Icons.edit),
        ),
      ]),
    );
  }
}
