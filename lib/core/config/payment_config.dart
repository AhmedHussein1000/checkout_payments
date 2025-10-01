class PaymentConfig {
  static const String usdCurrency = 'USD';
  static const String egpCurrency = 'EGP';
  //stripe
  static const String stripeBaseUrl = 'https://api.stripe.com/v1';
  static const String stripeCustomersEndPoint = '/customers';
  static const String stripeEphemeralKeyEndPoint = '/ephemeral_keys';
  static const String stripePaymentIntentEndPoint = '/payment_intents';
  static const String merchantName = 'E-Store';

  //paymob
  static const String paymobBaseUrl = 'https://accept.paymob.com/api';
  static const String paymobAuthEndPoint = '/auth/tokens';
  static const String paymobOrderEndPoint = '/ecommerce/orders';
}
