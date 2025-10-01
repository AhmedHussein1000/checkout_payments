import 'package:checkout_payments/Features/checkout/data/models/stripe_payment_models/init_payment_sheet_input_model.dart';
import 'package:checkout_payments/Features/checkout/data/models/stripe_payment_models/payment_intent_input_model.dart';
import 'package:checkout_payments/Features/checkout/data/models/stripe_payment_models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_payments/core/config/payment_config.dart';
import 'package:checkout_payments/core/config/secret_keys.dart';
import 'package:checkout_payments/core/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/models/user_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService;
  const StripeService(this.apiService);

  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url:
          '${PaymentConfig.stripeBaseUrl}${PaymentConfig.stripePaymentIntentEndPoint}',
      token: SecretKeys.stripeSecretKey,
    );

    PaymentIntentModel paymentIntentModel = PaymentIntentModel.fromJson(
      response.data,
    );

    return paymentIntentModel;
  }

  Future initPaymentSheet({
    required InitPaymentSheetInputModel initiPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
        merchantDisplayName: PaymentConfig.merchantName,
        allowsDelayedPaymentMethods: true,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future processPayment({CartModel? cart, UserModel? user}) async {
    
    var paymentIntentModel = await createPaymentIntent(
      PaymentIntentInputModel(
        amount: cart?.total.toString() ?? '0',
        currency: cart?.currency ?? PaymentConfig.usdCurrency,
      ),
    );
    await initPaymentSheet(
      initiPaymentSheetInputModel: InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
      ),
    );
    await displayPaymentSheet();
  }
}
