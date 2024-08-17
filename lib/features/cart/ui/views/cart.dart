import 'package:flutter/material.dart';
import 'package:food_dash/core/handler/icon_handler.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/cart/ui/widgets/empty_cart.dart';
import 'package:go_router/go_router.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () => GoRouter.of(context).push(AppRouter.homeView),
            child: Icon(Icons.arrow_back)),
        title: Text(
          "My Cart",
          style:
              AppStyles.styleSemiBold20.copyWith(fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: drawSvgIcon('more',
                height: 30, width: 30, iconColor: Colors.black87),
          )
        ],
      ),
      body: EmptyCart());
      // body: CartBody());
  }
}
