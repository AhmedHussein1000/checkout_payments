import 'package:flutter/material.dart';

class CardInfoItem extends StatelessWidget {
  const CardInfoItem({Key? key, required this.title, required this.value})
    : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
