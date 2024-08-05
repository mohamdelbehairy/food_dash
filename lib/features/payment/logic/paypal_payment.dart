import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:food_dash/core/utils/api_keys.dart';
import 'package:food_dash/features/payment/model/paypal_models/details_model.dart';

import '../model/paypal_models/amount_model.dart';
import '../model/paypal_models/item_list_model.dart';

class PaypalPayment {
  static void payWithPayPal(BuildContext context) {
    var getData = _getTransactionData();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.paypalClientID,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": getData.amountModel.toJson(),
            "description": "The payment transaction description.",
            "item_list": getData.itemList.toJson()
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          log('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  static ({AmountModel amountModel, ItemListModel itemList})
      _getTransactionData() {
    int totol = 0;
    int shippingDiscount = 10;

    List<Items> items = [
      Items(name: "Apple", quantity: 4, price: "50", currency: "EUR"),
      // Items(name: "Pineapple", quantity: 5, price: "4", currency: "EUR"),
    ];
    for (var item in items) {
      totol += (item.quantity! * int.parse(item.price!));
    }
    log('totol: $totol');
    var amountModel = AmountModel(
        total: (totol - shippingDiscount).toString(),
        currency: "EUR",
        details: DetailsModel(
            subtotal: totol.toString(),
            shipping: "0",
            shippingDiscount: shippingDiscount));

    var itemList = ItemListModel(items: items);
    return (amountModel: amountModel, itemList: itemList);
  }
}
