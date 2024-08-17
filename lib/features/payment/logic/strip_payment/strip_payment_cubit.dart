import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_dash/core/utils/service/strip_service.dart';

import '../../model/strip_models/payment_input_model.dart';

part 'strip_payment_state.dart';

class StripPaymentCubit extends Cubit<StripPaymentState> {
  StripPaymentCubit() : super(StripPaymentInitial());

  final _stripService = StripService();

  Future<void> makePayment({required PaymentInputModel paymentInputModel}) async {
    emit(StripPaymentLoading());
    await _stripService.makePayment(paymentInputModel).then((value) {
      emit(StripPaymentSuccess());
    }).catchError((e) {
      emit(StripPaymentFailure(errorMessage: e.toString()));
      debugPrint('error from make payment cubit: $e');
    });
  }
}
