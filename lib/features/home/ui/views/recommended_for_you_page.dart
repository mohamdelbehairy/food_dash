import 'package:flutter/material.dart';
import 'package:food_dash/core/utils/app_details/app_router.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/home/ui/widgets/recommended_for_you_body.dart';
import 'package:go_router/go_router.dart';

class RecommendedForYouPage extends StatefulWidget {
  const RecommendedForYouPage({super.key});

  @override
  State<RecommendedForYouPage> createState() => _RecommendedForYouPageState();
}

class _RecommendedForYouPageState extends State<RecommendedForYouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recommended For You',
                style: AppStyles.styleSemiBold20.copyWith(color: Colors.black,fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '😍',
                style: AppStyles.styleSemiBold18,
              ),
            ],
          ),
          leading: GestureDetector(
            onTap: () => GoRouter.of(context).push(AppRouter.homeView),
            child:Icon(Icons.arrow_back)),
      ),
      body: RecommendedForYouBody(),
    );
  }
}