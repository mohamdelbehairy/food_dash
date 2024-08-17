import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/features/home/logic/special_offers_cubit/special_offers_cubit.dart';
import 'package:food_dash/features/home/logic/special_offers_cubit/special_offers_state.dart';
import 'package:food_dash/features/home/repository/special_offers_repository.dart';
import 'package:food_dash/features/special_offers/ui/widgets/special_offer_widget.dart';

class SpecialOffersBody extends StatelessWidget {
  const SpecialOffersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpecialOffersCubit(SpecialOffersRepository()),
      child: BlocBuilder<SpecialOffersCubit, SpecialOffersState>(
        builder: (context, state) {
          if (state is SpecialOffersInitial) {
            context.read<SpecialOffersCubit>().getSpecialOffets();
            return Center(child: CircularProgressIndicator());
          } else if (state is GetSpecialOffersSuccess) {
            List<Map<String, dynamic>> specialOffers = state.productsModel;
            print('pecialOfferslength : ${specialOffers.length}');
            return ListView.separated(
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: specialOffers.length,
                padding: EdgeInsets.only(
                  top: 20,
                ),
                itemBuilder: (context, index) =>
                    SpecialOfferWidget(context, specialOffers[index]));
          } else if (state is GetSpecialOffersFailure) {
            return Center(
              child: Text(
                'Error fetching discounted products',
                style: TextStyle(color: Colors.black),
              ),
            );
          } else {
            return Center(
              child: Text('Unexpected state: $state'),
            );
          }
        },
      ),
    );
  }
}
