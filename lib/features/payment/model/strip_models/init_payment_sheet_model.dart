class InitPaymentSheetModel {
  final String clientSecret, ephemeralKey, customerID;

  InitPaymentSheetModel(
      {required this.clientSecret,
      required this.ephemeralKey,
      required this.customerID});
}
