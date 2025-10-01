import 'dart:developer';

import 'package:checkout_payments/Features/checkout/data/models/paypal_payment_models/amount_models/amount_model.dart';
import 'package:checkout_payments/Features/checkout/data/models/paypal_payment_models/amount_models/details_model.dart';
import 'package:checkout_payments/Features/checkout/data/models/paypal_payment_models/items_models/paypal_item_list_model.dart';
import 'package:checkout_payments/Features/checkout/data/models/paypal_payment_models/items_models/paypal_item_model.dart';
import 'package:checkout_payments/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:checkout_payments/core/config/secret_keys.dart';
import 'package:checkout_payments/core/functions/custom_toast.dart';
import 'package:checkout_payments/Features/checkout/data/models/paypal_payment_models/paypal_payment_model.dart';

class PaypalService {
  static void processPaypalPayment(
    BuildContext context, {
    required CartModel cart,
  }) {
    PaypalPaymentModel paypalPaymentModel = PaypalPaymentModel(
      amount: AmountModel(
        total: cart.total.toString(),
        currency: cart.currency,
        details: DetailsModel(
          subtotal: cart.subtotal.toString(),
          discount: cart.discount,
          shipping: cart.shipping.toString(),
        ),
      ),
      description: 'Test paypal Payment',
      itemList: PaypalItemListModel(
        items: [
          PaypalItemModel(
            name: cart.items?[0].name,
            quantity: cart.items?[0].quantity,
            price: cart.items?[0].price.toString(),
            currency: cart.currency,
          ),
           PaypalItemModel(
            name: cart.items?[1].name,
            quantity: cart.items?[1].quantity,
            price: cart.items?[1].price.toString(),
            currency: cart.currency,
          ),
        ],
      ),
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: SecretKeys.paypalClientId,
          secretKey: SecretKeys.paypalSecretkey,
          transactions: [paypalPaymentModel.toJson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            customToast(message: 'Payment Success', state: ToastStates.success);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ThankYouView(cart: cart);
                },
              ),
              (route) {
                if (route.settings.name == '/') {
                  return true;
                } else {
                  return false;
                }
              },
            );
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);

            customToast(message: 'Payment Error', state: ToastStates.error);
          },
          onCancel: () {
            log('cancelled:');
          },
        ),
      ),
    );
  }
}
