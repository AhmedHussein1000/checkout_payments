class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String? customerId;

  const PaymentIntentInputModel({
     this.customerId,
    required this.amount,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': (num.parse(amount) * 100).round().toString(),
      'currency': currency,
      'customer': customerId,
    };
  }
}
