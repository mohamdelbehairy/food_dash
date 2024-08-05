import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:food_dash/core/utils/api_keys.dart';
import 'package:food_dash/core/utils/service/api_service.dart';
import 'package:food_dash/features/payment/model/paymob_models/make_payment_model.dart';
import 'package:food_dash/features/payment/model/paymob_models/order_registration_model.dart';

import '../../../features/payment/model/paymob_models/payment_key_model.dart';

class PaymobService {
  final _apiService = ApiService();

  Future<String> authentication() async {
    var response = await _apiService.post(
        url: '${ApiKeys.baseUrlBaymob}auth/tokens',
        contentType: Headers.jsonContentType,
        headers: {
          'contentType': 'application/json',
        },
        body: {
          'api_key': ApiKeys.paymobApiKey,
        });

    log('firstToken: ${response.data['token']}');
    return response.data['token'];
  }

  Future<int> orderRegistration(
      {required OrderRegistrationModel orderRegistrationModel}) async {
    var response = await _apiService.post(
        url: '${ApiKeys.baseUrlBaymob}ecommerce/orders',
        contentType: Headers.jsonContentType,
        headers: {
          'contentType': 'application/json',
        },
        body: orderRegistrationModel.toJson());
    log('id: ${response.data['id']}');
    return response.data['id'];
  }

  Future<String> paymentKey({required PaymentKeyModel paymnentKeyModel}) async {
    var response = await _apiService.post(
        url: '${ApiKeys.baseUrlBaymob}acceptance/payment_keys',
        contentType: Headers.jsonContentType,
        headers: {
          'Content-Type': 'application/json',
        },
        body: paymnentKeyModel.toJson());
    log('final token: ${response.data['token']}');
    return response.data['token'];
  }

  Future<String> makePayment(MakePaymentModel makePaymentModel) async {
    var auth = await authentication();
    var order = await orderRegistration(
        orderRegistrationModel: OrderRegistrationModel(
      authToken: auth,
      price: makePaymentModel.price,
      currency: "EGP",
    ));

    return await paymentKey(
        paymnentKeyModel: PaymentKeyModel(
            authToken: auth,
            amountCents: makePaymentModel.price,
            orderId: order.toString(),
            billingData: BillingDataModel(
                firstName: makePaymentModel.firstName,
                lastName: makePaymentModel.lastName),
            currency: "EGP",
            integrationId: ApiKeys.paymobIntegrationID));
  }
}
