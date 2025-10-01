import 'dart:developer';

import 'package:checkout_payments/Features/checkout/data/models/paymob_payment_models/paymob_payment_order_input_model/payment_link_request/paymob_order_item_input.dart';
import 'package:checkout_payments/Features/checkout/data/models/paymob_payment_models/paymob_payment_order_input_model/payment_link_request/paymob_payment_order_input.dart';
import 'package:checkout_payments/Features/checkout/data/models/paymob_payment_models/paymob_payment_order_input_model/payment_link_request/paymob_order_shipping_data_input.dart';
import 'package:checkout_payments/Features/checkout/data/models/paymob_payment_models/paymob_payment_order_response_model/paymob_payment_link_response/paymob_payment_order_response.dart';
import 'package:checkout_payments/Features/checkout/data/models/paymob_payment_models/paymob_auth_model/paymob_auth_model.dart';
import 'package:checkout_payments/core/config/payment_config.dart';
import 'package:checkout_payments/core/config/secret_keys.dart';
import 'package:checkout_payments/core/errors/exceptions.dart';
import 'package:checkout_payments/core/network/api_service.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/models/user_model.dart';

class PaymobService {
  final ApiService apiService;
  const PaymobService(this.apiService);

  static String? _cachedToken;
  static DateTime? _tokenExpiry;

  Future<String> _getValidToken() async {
    if (_cachedToken != null &&
        _tokenExpiry != null &&
        DateTime.now().isBefore(_tokenExpiry!)) {
      return _cachedToken!;
    }

    int retryCount = 0;
    int maxRetries = 3;
    while (retryCount < maxRetries) {
      try {
        var response = await apiService.post(
          body: {'api_key': SecretKeys.paymobApiKey},
          url:
              '${PaymentConfig.paymobBaseUrl}${PaymentConfig.paymobAuthEndPoint}',
          headers: {'Content-Type': 'application/json'},
        );
        PaymobAuthModel paymobAuthModel = PaymobAuthModel.fromJson(
          response.data,
        );
        if (paymobAuthModel.token != null) {
          _cachedToken = paymobAuthModel.token;
          _tokenExpiry = DateTime.now().add(Duration(minutes: 10));
          return _cachedToken!;
        } else {
          log('Failed to authenticate with Paymob: No token received');
          throw ServerException('Payment Failed');
        }
      } catch (e) {
        retryCount++;
        if (retryCount >= maxRetries) {
          log('Failed to authenticate with Paymob after multiple attempts');
          throw ServerException('Payment Failed');
        }
        await Future.delayed(Duration(milliseconds: 2000));
      }
    }

    throw ServerException('Failed to authenticate with Paymob');
  }

  Future<PaymobAuthModel> authenticate() async {
    var token = await _getValidToken();
    return PaymobAuthModel(token: token);
  }

  Future<PaymobPaymentOrderResponseModel> createOrder({
    CartModel? cart,
    UserModel? user,
  }) async {
    final token = await _getValidToken();
    log('token : $token');
    final email = user?.email ?? 'test@example.com';
    final firstName = user?.firstName ?? 'Customer';
    final lastName = user?.lastName ?? 'Name';
    final phoneNumber = user?.phoneNumber ?? '1234567890';

    final paymentLinkRequest = PaymobPaymentOrderInputModel(
      authToken: token,
      amountCents: cart != null ? (cart.total * 100).round().toString() : '0',
      apiSource: "INVOICE",
      currency: PaymentConfig.egpCurrency,
      shippingData: PaymobOrderShippingDataInputModel(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
      ),
      integrations: [
        SecretKeys.paymobCardIntegrationId,
        SecretKeys.paymobWalletIntegrationId,
        SecretKeys.paymobKioskIntegrationId,
      ],
      items: [
        PaymobOrderItemInputModel(
          amountCents: (cart?.total ?? 0 * 100).round().toString(),
          description: cart?.items?.first.name ?? 'Payment',
          name: cart?.items?.first.name ?? 'Payment',
          quantity: cart?.items?.first.quantity.toString() ?? '1',
        ),
      ],
      deliveryNeeded: 'false',
    );

    try {
      var response = await apiService.post(
        body: paymentLinkRequest.toJson(),
        url:
            '${PaymentConfig.paymobBaseUrl}${PaymentConfig.paymobOrderEndPoint}',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      return PaymobPaymentOrderResponseModel.fromJson(response.data);
    } catch (e) {
      log('Failed to create Paymob order: ${e.toString()}');
      throw ServerException('Payment Failed');
    }
  }
}
