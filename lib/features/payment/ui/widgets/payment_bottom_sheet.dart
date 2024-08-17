import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_images.dart';
import 'package:food_dash/features/payment/model/payment_bottom_model.dart';

import '../../../../core/utils/app_details/app_styles.dart';
import 'payment_bottom_sheet_button.dart';
import 'payment_bottom_sheet_item.dart';

class PaymentBottomSheet extends StatefulWidget {
  const PaymentBottomSheet({super.key});

  @override
  State<PaymentBottomSheet> createState() => _PaymentBottomSheetState();
}

class _PaymentBottomSheetState extends State<PaymentBottomSheet> {
  int activeIndex = 0;
  static const List items = [
    Assets.imagesCard,
    Assets.imagesPaypal,
    Assets.imagesPaymob
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Text('Select a Payment Method',
              style: AppStyles.styleSemiBold20
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(items.length, (index) {
              return GestureDetector(
                  onTap: () {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  child: PaymentBottomSheetItem(
                      paymentBottomModel: PaymentBottomModel(
                          index: index == 2,
                          image: items[index],
                          isActive: activeIndex == index)));
            }),
          ),
          const SizedBox(height: 20),
          PaymentBottomSheetButton(activeIndex: activeIndex),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
