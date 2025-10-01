class PaymobItemModel {
  String? name;
  String? description;
  int? amountCents;
  int? quantity;

  PaymobItemModel({
    this.name,
    this.description,
    this.amountCents,
    this.quantity,
  });

  factory PaymobItemModel.fromJson(Map<String, dynamic> json) =>
      PaymobItemModel(
        name: json['name'] as String?,
        description: json['description'] as String?,
        amountCents: json['amount_cents'] as int?,
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'amount_cents': amountCents,
    'quantity': quantity,
  };
}
