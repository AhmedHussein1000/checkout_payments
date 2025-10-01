import 'package:checkout_payments/Features/checkout/presentation/views/widgets/thank_you_view_widgets/card_info_item.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({Key? key, this.cart, this.user}) : super(key: key);

  final CartModel? cart;
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    // Get current date and time for the transaction
    final now = DateTime.now();
    final dateFormat = DateFormat('dd/MM/yyyy');
    final timeFormat = DateFormat('hh:mm a');

    final formattedDate = dateFormat.format(now);
    final formattedTime = timeFormat.format(now);

    // Get recipient name from user model or use default
    final recipientName = user != null
        ? '${user!.firstName} ${user!.lastName}'
        : 'Guest User';

    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 42),
            CardInfoItem(title: 'Date', value: formattedDate),
            const SizedBox(height: 12),
            CardInfoItem(title: 'Time', value: formattedTime),
            const SizedBox(height: 12),
            CardInfoItem(title: 'To', value: recipientName),
            const SizedBox(height: 12),
            Container(
              width: 113,
              height: 58,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1.50, color: Color(0xFF34A853)),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Center(
                child: Text(
                  'PAID',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF34A853),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
