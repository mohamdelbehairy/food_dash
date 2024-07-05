import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/special_offers/special_offers_cubit.dart/special_offers_cubit.dart';
import 'package:food_dash/features/special_offers/special_offers_cubit.dart/special_offers_state.dart';
import 'package:food_dash/features/special_offers/ui/widgets/special_offer_widget.dart';

class SpecialOffersBody extends StatelessWidget {
  const SpecialOffersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpecialOffersCubit(),
      child: BlocConsumer<SpecialOffersCubit, SpecialOffersState>(
        listener: (context, state) {},
        builder: (context, state) {
          SpecialOffersCubit specialOffersCubit = SpecialOffersCubit.get(context);
          return ListView.separated(
            scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
              itemCount: specialOffersCubit.specialOfferList.length,
              padding: EdgeInsets.only(top: 20,  ),
              itemBuilder: (context, index) =>
                  SpecialOfferWidget(context, specialOffersCubit.specialOfferList[index]));
        },
      ),
    );
  }
}