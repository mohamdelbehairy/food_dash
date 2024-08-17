import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_dash/core/utils/service/api_service.dart';
import 'package:food_dash/features/payment/model/strip_models/ephemeral_key_model.dart';
import 'package:food_dash/features/payment/model/strip_models/init_payment_sheet_model.dart';

import '../../../features/payment/model/strip_models/payment_input_model.dart';
import '../../../features/payment/model/strip_models/payment_intent_model.dart';
import '../api_keys.dart';

class StripService {
  final _apiService = ApiService();

  Future<void> createCustomer({required String name}) async {
    await _apiService.post(
      url: 'https://api.stripe.com/v1/customers',
      body: {
        'id': FirebaseAuth.instance.currentUser!.uid,
        'name': name,
      },
    );
  }

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentInputModel paymentInputModel) async {
    var response = await _apiService.post(
        url: 'https://api.stripe.com/v1/payment_intents',
        body: paymentInputModel.toJson());
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<void> initPaymentSheet(
      {required InitPaymentSheetModel initPaymentSheetModel}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            merchantDisplayName: 'Food Dash',
            paymentIntentClientSecret: initPaymentSheetModel.clientSecret,
            customerEphemeralKeySecret: initPaymentSheetModel.ephemeralKey,
            customerId: initPaymentSheetModel.customerID));
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EpemeralKeyModel> createEpehemeralKey(
      {required String customerID}) async {
    var response = await _apiService
        .post(url: 'https://api.stripe.com/v1/ephemeral_keys', body: {
      'customer': customerID,
    }, headers: {
      'Authorization': 'Bearer ${ApiKeys.stripSecretKey}',
      'Stripe-Version': '2024-06-20'
    });
    return EpemeralKeyModel.fromJson(response.data);
  }

  Future<void> makePayment(PaymentInputModel paymentInputModel) async {
    final createPayment = await createPaymentIntent(paymentInputModel);
    final createEpehemeral =
        await createEpehemeralKey(customerID: paymentInputModel.customerID);
    await initPaymentSheet(
        initPaymentSheetModel: InitPaymentSheetModel(
            clientSecret: createPayment.clientSecret!,
            ephemeralKey: createEpehemeral.secret!,
            customerID: paymentInputModel.customerID));
    await displayPaymentSheet();
  }
}
