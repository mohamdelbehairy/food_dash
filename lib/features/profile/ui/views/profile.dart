import 'package:flutter/material.dart';
import 'package:food_dash/features/payment/ui/widgets/payment_bottom_sheet.dart';

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
            showModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                builder: (context) => PaymentBottomSheet());
          },
          icon: Icon(Icons.edit),
        ),
      ]),
    );
  }
}
