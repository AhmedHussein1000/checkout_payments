import 'package:checkout_payments/Features/checkout/presentation/views/widgets/thank_you_view_widgets/thank_you_card.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/models/user_model.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key, this.cart, this.user});

  final CartModel? cart;
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(cart: cart, user: user),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2 + 30,
            left: 0,
            right: 0,
            child: Icon(Icons.check_circle, color: Colors.green, size: 70),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            left: 0,
            right: 0,
            child: const Center(
              child: Text(
                'Payment Completed!',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * .15,
              decoration: const ShapeDecoration(
                color: Color(0xFF34A853),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  'Total: ${cart!.currency} ${cart!.total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
