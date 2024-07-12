import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_dash/core/utils/app_details/app_colors.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
class SpecialOfferBody extends StatelessWidget {
  const SpecialOfferBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(26),
        // image: DecorationImage(image: AssetImage(Assets.imagesOnBoardringOne),fit: BoxFit.cover)
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "30%",
                    style: AppStyles.styleSemiBold48
                        .copyWith(color: Colors.white, fontSize: 58),
                  ),
                  Text(
                    "DISCOUNT ONLY VAILD FOR TODAY!",
                    style: AppStyles.styleSemiBold18.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SvgPicture.asset(
              'assets/icons/svg/burger.svg',
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
