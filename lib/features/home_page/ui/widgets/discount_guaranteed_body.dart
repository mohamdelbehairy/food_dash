import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/home/logic/discount_guaranteed/discount_guaranteed_cubit.dart';
import 'package:food_dash/features/home/logic/discount_guaranteed/discount_guaranteed_state.dart';
import 'package:food_dash/features/home_page/ui/widgets/discount_category_widget.dart';

class DiscountGuaranteedBody extends StatelessWidget {
  const DiscountGuaranteedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscountGuaranteedCubit(),
      child: BlocConsumer<DiscountGuaranteedCubit, DiscountGuaranteedState>(
        listener: (context, state) => (),
        builder: (context, state) {
          DiscountGuaranteedCubit DiscountGuaranteedCubitInstance =
              DiscountGuaranteedCubit.get(context);
          return Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 16),
            child: Container(
              height: 300,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                        width: 18,
                      ),
                  itemCount: DiscountGuaranteedCubitInstance.categories.length,
                  itemBuilder: (context, index) => DiscountCategoryComponent(
                      context,
                      DiscountGuaranteedCubitInstance.categories[index])),
            ),
          );
        },
      ),
    );
  }
}
