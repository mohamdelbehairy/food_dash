import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_dash/core/utils/app_details/app_styles.dart';
import 'package:food_dash/features/home/logic/special_offers_cubit/special_offers_cubit.dart';
import 'package:food_dash/features/home/logic/special_offers_cubit/special_offers_state.dart';
import 'package:food_dash/features/home/model/product_model.dart';
import 'package:food_dash/features/home/repository/special_offers_repository.dart';
import 'package:hexcolor/hexcolor.dart';

class SpecialOfferBody extends StatelessWidget {
  const SpecialOfferBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpecialOffersCubit(SpecialOffersRepository()),
      child: BlocBuilder<SpecialOffersCubit, SpecialOffersState>(
        builder: (context, state) {
          if (state is SpecialOffersInitial) {
            context.read<SpecialOffersCubit>().getSpecialOffets();
            return Center(child: CircularProgressIndicator());
          } 
          else if (state is GetSpecialOffersSuccess) {
            List<Map<String, dynamic>> specialOffers = state.productsModel;
            return SizedBox(
              height: 200, // Ensure the ListView has a defined height
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                separatorBuilder: (context, index) => SizedBox(height: 18),
                itemCount: 1,
                itemBuilder: (context, index) {
                  Map<String, dynamic> category = specialOffers[index];
                  List<ProductsModel> discountedProducts =
                      category['discountedProducts'];
                  ProductsModel highestDiscountedProduct =
                      discountedProducts.reduce((a, b) =>
                          a.discountRatio! > b.discountRatio! ? a : b);
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: HexColor(category['categoryColor']),
                      borderRadius: BorderRadius.circular(26),
                    
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
                                  "${highestDiscountedProduct.discountRatio!.toStringAsFixed(0)}%",
                                  style: AppStyles.styleSemiBold48.copyWith(
                                    color: Colors.white,
                                    fontSize: 58,
                                  ),
                                ),
                                Text(
                                  "DISCOUNT ONLY VAILD FOR TODAY!",
                                  style: AppStyles.styleSemiBold18.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: SvgPicture.network(
                            '${category['categoryImage']}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
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
