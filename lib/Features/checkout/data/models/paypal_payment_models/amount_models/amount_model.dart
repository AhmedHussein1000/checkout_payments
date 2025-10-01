import 'package:checkout_payments/Features/checkout/data/models/paypal_payment_models/amount_models/details_model.dart';

class AmountModel {
  final String? total;
  final String? currency;
  final DetailsModel? details;

  AmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });
  Map<String, dynamic> toJson() => {
    'total': total,
    'currency': currency,
    'details': details?.toJson(),
  };

}
