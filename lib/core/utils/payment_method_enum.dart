enum PaymentMethod { stripe, paypal, paymob }


   PaymentMethod paymentMethodFromIndex(int index) {
    switch (index) {
      case 0:
        return PaymentMethod.stripe;
      case 1:
        return PaymentMethod.paypal;
      case 2:
        return PaymentMethod.paymob;
      default:
        return PaymentMethod.stripe;
    }
}
