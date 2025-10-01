import 'package:checkout_payments/core/config/payment_config.dart';

class CartModel {
  final num subtotal;
  final double discount;
  final double shipping;
  final String currency;
  final List<CartItemModel>? items;

  const CartModel({
    required this.subtotal,
    this.discount = 0,
    this.shipping = 0,
    this.currency = PaymentConfig.usdCurrency,
    this.items,
  });

  num get total => subtotal - discount + shipping;
}

class CartItemModel {
  final String name;
  final String? description;
  final num price;
  final int quantity;
  final String? imageUrl;

  const CartItemModel({
    required this.name,
    required this.price,
    this.quantity = 1,
    this.description,
    this.imageUrl,
  });

  num get total => price * quantity;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description ?? name,
      'price': price,
      'quantity': quantity,
      'total': total,
    };
  }
}
