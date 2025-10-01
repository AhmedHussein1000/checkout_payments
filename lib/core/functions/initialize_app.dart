
import 'package:checkout_payments/core/config/secret_keys.dart';
import 'package:checkout_payments/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void initializeApp()  {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = SecretKeys.stripePublishableKey;
  setupServiceLocator();
}