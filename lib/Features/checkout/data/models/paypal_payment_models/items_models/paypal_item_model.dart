class PaypalItemModel {
  final String? name;
  final int? quantity;
  final String? price;
  final String? currency;

  PaypalItemModel({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };

}
