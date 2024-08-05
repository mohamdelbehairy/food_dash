class PaymentInputModel {
  final String amount, currency, customerID;

  PaymentInputModel(
      {required this.amount, required this.currency, required this.customerID});

  toJson() {
    return {'amount': amount, 'currency': currency, 'customer': customerID};
  }
}
