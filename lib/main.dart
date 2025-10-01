import 'package:checkout_payments/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:checkout_payments/core/functions/initialize_app.dart';
import 'package:flutter/material.dart';

void main() {
   initializeApp();
  runApp(const CheckoutApp());
}


class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}