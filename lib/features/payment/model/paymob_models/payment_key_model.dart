class PaymentKeyModel {
  final String authToken, amountCents, orderId, currency;
  final BillingDataModel billingData;
  final int integrationId;

  PaymentKeyModel(
      {required this.authToken,
      required this.amountCents,
      required this.orderId,
      required this.billingData,
      required this.currency,
      required this.integrationId});

  Map<String, dynamic> toJson() {
    return {
      "auth_token": authToken,
      "amount_cents": amountCents,
      "expiration": 3600,
      "order_id": orderId,
      "billing_data": billingData.toJson(),
      "currency": currency,
      "integration_id": integrationId
    };
  }
}

class BillingDataModel {
  final String firstName, lastName;
  String? apartment,
      email,
      floor,
      street,
      building,
      phoneNumber,
      shippingMethod,
      postalCode,
      city,
      country,
      state;

  BillingDataModel(
      {this.apartment,
      this.email,
      this.floor,
      required this.firstName,
      this.street,
      this.building,
      this.phoneNumber,
      this.shippingMethod,
      this.postalCode,
      this.city,
      this.country,
      required this.lastName,
      this.state});

  Map<String, dynamic> toJson() {
    return {
      "apartment": "NA",
      "email": "NA",
      "floor": "NA",
      "first_name": firstName,
      "street": "NA",
      "building": "NA",
      "phone_number": "NA",
      "shipping_method": "NA",
      "postal_code": "NA",
      "city": "NA",
      "country": "NA",
      "last_name": lastName,
      "state": "NA"
    };
  }
}