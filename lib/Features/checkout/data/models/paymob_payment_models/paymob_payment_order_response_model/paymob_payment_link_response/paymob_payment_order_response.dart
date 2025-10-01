import 'package:checkout_payments/Features/checkout/data/models/paymob_payment_models/paymob_payment_order_response_model/paymob_payment_link_response/paymob_shipping_data_model.dart';

import 'paymob_data_model.dart';
import 'paymob_item_model.dart';
import 'paymob_merchant_model.dart';

class PaymobPaymentOrderResponseModel {
  int? id;
  DateTime? createdAt;
  bool? deliveryNeeded;
  PaymobMerchantModel? merchant;
  dynamic collector;
  int? amountCents;
  PaymobShippingDataModel? shippingData;
  String? currency;
  bool? isPaymentLocked;
  bool? isReturn;
  bool? isCancel;
  bool? isReturned;
  bool? isCanceled;
  dynamic merchantOrderId;
  dynamic walletNotification;
  int? paidAmountCents;
  bool? notifyUserWithEmail;
  List<PaymobItemModel>? items;
  String? orderUrl;
  int? commissionFees;
  int? deliveryFeesCents;
  int? deliveryVatCents;
  String? paymentMethod;
  dynamic merchantStaffTag;
  String? apiSource;
  PaymobDataModel? data;
  String? paymentStatus;
  String? token;
  String? url;

  PaymobPaymentOrderResponseModel({
    this.id,
    this.createdAt,
    this.deliveryNeeded,
    this.merchant,
    this.collector,
    this.amountCents,
    this.shippingData,
    this.currency,
    this.isPaymentLocked,
    this.isReturn,
    this.isCancel,
    this.isReturned,
    this.isCanceled,
    this.merchantOrderId,
    this.walletNotification,
    this.paidAmountCents,
    this.notifyUserWithEmail,
    this.items,
    this.orderUrl,
    this.commissionFees,
    this.deliveryFeesCents,
    this.deliveryVatCents,
    this.paymentMethod,
    this.merchantStaffTag,
    this.apiSource,
    this.data,
    this.paymentStatus,
    this.token,
    this.url,
  });

  factory PaymobPaymentOrderResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymobPaymentOrderResponseModel(
      id: json['id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      deliveryNeeded: json['delivery_needed'] as bool?,
      merchant: json['merchant'] == null
          ? null
          : PaymobMerchantModel.fromJson(
              json['merchant'] as Map<String, dynamic>,
            ),
      collector: json['collector'] as dynamic,
      amountCents: json['amount_cents'] as int?,
      shippingData: json['shipping_data'] == null
          ? null
          : PaymobShippingDataModel.fromJson(
              json['shipping_data'] as Map<String, dynamic>,
            ),
      currency: json['currency'] as String?,
      isPaymentLocked: json['is_payment_locked'] as bool?,
      isReturn: json['is_return'] as bool?,
      isCancel: json['is_cancel'] as bool?,
      isReturned: json['is_returned'] as bool?,
      isCanceled: json['is_canceled'] as bool?,
      merchantOrderId: json['merchant_order_id'] as dynamic,
      walletNotification: json['wallet_notification'] as dynamic,
      paidAmountCents: json['paid_amount_cents'] as int?,
      notifyUserWithEmail: json['notify_user_with_email'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => PaymobItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderUrl: json['order_url'] as String?,
      commissionFees: json['commission_fees'] as int?,
      deliveryFeesCents: json['delivery_fees_cents'] as int?,
      deliveryVatCents: json['delivery_vat_cents'] as int?,
      paymentMethod: json['payment_method'] as String?,
      merchantStaffTag: json['merchant_staff_tag'] as dynamic,
      apiSource: json['api_source'] as String?,
      data: json['data'] == null
          ? null
          : PaymobDataModel.fromJson(json['data'] as Map<String, dynamic>),
      paymentStatus: json['payment_status'] as String?,
      token: json['token'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt?.toIso8601String(),
    'delivery_needed': deliveryNeeded,
    'merchant': merchant?.toJson(),
    'collector': collector,
    'amount_cents': amountCents,
    'shipping_data': shippingData?.toJson(),
    'currency': currency,
    'is_payment_locked': isPaymentLocked,
    'is_return': isReturn,
    'is_cancel': isCancel,
    'is_returned': isReturned,
    'is_canceled': isCanceled,
    'merchant_order_id': merchantOrderId,
    'wallet_notification': walletNotification,
    'paid_amount_cents': paidAmountCents,
    'notify_user_with_email': notifyUserWithEmail,
    'items': items?.map((e) => e.toJson()).toList(),
    'order_url': orderUrl,
    'commission_fees': commissionFees,
    'delivery_fees_cents': deliveryFeesCents,
    'delivery_vat_cents': deliveryVatCents,
    'payment_method': paymentMethod,
    'merchant_staff_tag': merchantStaffTag,
    'api_source': apiSource,
    'data': data?.toJson(),
    'payment_status': paymentStatus,
    'token': token,
    'url': url,
  };
}
