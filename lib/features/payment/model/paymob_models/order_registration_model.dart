class OrderRegistrationModel {
  final String authToken, price, currency;

  OrderRegistrationModel(
      {required this.authToken, required this.price, required this.currency});

  toJson() {
    return {
      "auth_token": authToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items": []
    };
  }
}
