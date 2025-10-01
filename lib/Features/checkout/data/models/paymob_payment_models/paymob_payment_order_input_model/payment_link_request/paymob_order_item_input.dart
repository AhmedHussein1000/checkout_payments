class PaymobOrderItemInputModel {
  String? name;
  String? amountCents;
  String? quantity;
  String? description;

  PaymobOrderItemInputModel({
    this.name,
    this.amountCents,
    this.quantity,
    this.description,
  });

  factory PaymobOrderItemInputModel.fromJson(Map<String, dynamic> json) =>
      PaymobOrderItemInputModel(
        name: json['name'] as String?,
        amountCents: json['amount_cents'] as String?,
        quantity: json['quantity'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'amount_cents': amountCents,
    'quantity': quantity,
    'description': description,
  };
}
