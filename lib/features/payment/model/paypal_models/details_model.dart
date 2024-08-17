class DetailsModel {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  DetailsModel(
      {required this.subtotal,
      required this.shipping,
      required this.shippingDiscount});

  DetailsModel.fromJson(Map<String, dynamic> json) {
    if (json["subtotal"] is String) {
      subtotal = json["subtotal"];
    }
    if (json["shipping"] is String) {
      shipping = json["shipping"];
    }
    if (json["shipping_discount"] is int) {
      shippingDiscount = json["shipping_discount"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["subtotal"] = subtotal;
    data["shipping"] = shipping;
    data["shipping_discount"] = shippingDiscount;
    return data;
  }
}
