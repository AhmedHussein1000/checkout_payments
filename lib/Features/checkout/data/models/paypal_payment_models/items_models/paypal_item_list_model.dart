import 'package:checkout_payments/Features/checkout/data/models/paypal_payment_models/items_models/paypal_item_model.dart';

class PaypalItemListModel {
  final List<PaypalItemModel>? items;

  PaypalItemListModel({required this.items});

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
