import 'details_model.dart';

class AmountModel {
  String? total;
  String? currency;
  DetailsModel? details;

  AmountModel(
      {required this.total, required this.currency, required this.details});

  AmountModel.fromJson(Map<String, dynamic> json) {
    if (json["total"] is String) {
      total = json["total"];
    }
    if (json["currency"] is String) {
      currency = json["currency"];
    }
    if (json["details"] is Map) {
      details = json["details"] == null
          ? null
          : DetailsModel.fromJson(json["details"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total"] = total;
    data["currency"] = currency;
    if (details != null) {
      data["details"] = details?.toJson();
    }
    return data;
  }
}

