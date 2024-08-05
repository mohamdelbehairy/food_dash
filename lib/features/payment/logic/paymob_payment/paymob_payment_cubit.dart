import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/service/paymob_service.dart';

import '../../model/paymob_models/make_payment_model.dart';

part 'paymob_payment_state.dart';

class PaymobPaymentCubit extends Cubit<PaymobPaymentState> {
  PaymobPaymentCubit() : super(PaymobPaymentInitial());
  final _paymobService = PaymobService();

  String token = "";
  Future<void> makePayment({required MakePaymentModel makePaymentModel}) async {
    emit(PaymobPaymentLoading());
    await _paymobService.makePayment(makePaymentModel).then((value) {
      token = value;
      emit(PaymobPaymentSuccess());
    }).catchError((e) {
      emit(PaymobPaymentFailure(errorMessage: e.toString()));
      debugPrint('error from make payment method: $e');
    });
  }
}
