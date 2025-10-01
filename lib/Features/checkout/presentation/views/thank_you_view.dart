import 'package:checkout_payments/Features/checkout/presentation/views/widgets/thank_you_view_widgets/thank_you_view_body.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/models/user_model.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key, this.cart, this.user});

  final CartModel? cart;
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ThankYouViewBody(cart: cart, user: user),
    );
  }
}
