import 'paymob_order_item_input.dart';
import 'paymob_order_shipping_data_input.dart';

class PaymobPaymentOrderInputModel {
  String? authToken;
  String? apiSource;
  String? amountCents;
  String? currency;
  PaymobOrderShippingDataInputModel? shippingData;
  List<int>? integrations;
  List<PaymobOrderItemInputModel>? items;
  String? deliveryNeeded;

  PaymobPaymentOrderInputModel({
    this.authToken,
    this.apiSource,
    this.amountCents,
    this.currency,
    this.shippingData,
    this.integrations,
    this.items,
    this.deliveryNeeded,
  });

  factory PaymobPaymentOrderInputModel.fromJson(Map<String, dynamic> json) {
    return PaymobPaymentOrderInputModel(
      authToken: json['auth_token'] as String?,
      apiSource: json['api_source'] as String?,
      amountCents: json['amount_cents'] as String?,
      currency: json['currency'] as String?,
      shippingData: json['shipping_data'] == null
          ? null
          : PaymobOrderShippingDataInputModel.fromJson(
              json['shipping_data'] as Map<String, dynamic>,
            ),
      integrations: json['integrations'] as List<int>?,
      items: (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                PaymobOrderItemInputModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      deliveryNeeded: json['delivery_needed'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'auth_token': authToken,
    'api_source': apiSource,
    'amount_cents': amountCents,
    'currency': currency,
    'shipping_data': shippingData?.toJson(),
    'integrations': integrations,
    'items': items?.map((e) => e.toJson()).toList(),
    'delivery_needed': deliveryNeeded,
  };
}
