class DetailsModel {
  final String? subtotal;
  final String? shipping;
  final double? discount;

  DetailsModel({
    required this.subtotal,
    required this.shipping,
    required this.discount,
  });
  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': discount,
  };
}
