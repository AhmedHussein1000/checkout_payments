import 'package:checkout_payments/Features/checkout/presentation/views/widgets/my_cart_view_widgets/my_cart_view_body.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/widgets/cutom_app_bar.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartModel(
      subtotal: 50,
      discount: 0,
      shipping: 10,
      items: [
        CartItemModel(name: 'Product 1', price: 35,quantity: 1),
        CartItemModel(name: 'Product 2', price: 15,quantity: 1),
      ],
    );

    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: MyCartViewBody(cart: cart),
    );
  }
}
