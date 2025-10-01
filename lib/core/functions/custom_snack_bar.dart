import 'package:flutter/material.dart';

void customSnackBar(
  BuildContext context,
  String message, {
  Duration? duration,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: backgroundColor,
    ),
  );
}
