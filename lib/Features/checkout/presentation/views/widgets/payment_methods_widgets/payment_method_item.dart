import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.isActive,
    required this.image,
  });

  final bool isActive;
  final String image;

  Widget _buildImage(String imagePath) {
    if (imagePath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(imagePath);
    } else {
      return Image.asset(imagePath, fit: BoxFit.contain);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 103,
      height: 62,
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
              color: isActive ? const Color(0xFF34A853) : Colors.transparent,
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isActive ? const Color(0xFF34A853) : Colors.grey,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(child: _buildImage(image)),
        ),
      ),
    );
  }
}
