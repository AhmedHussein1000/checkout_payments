import 'dart:developer';
import 'package:checkout_payments/Features/checkout/data/repos/base_checkout_repo.dart';
import 'package:checkout_payments/core/errors/exceptions.dart';
import 'package:checkout_payments/core/errors/failures.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/models/user_model.dart';
import 'package:checkout_payments/core/services/paymob_service.dart';
import 'package:checkout_payments/core/services/stripe_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutRepoImpl extends BaseCheckoutRepo {
  final StripeService stripeService;
  final PaymobService paymobService;

  CheckoutRepoImpl(this.stripeService, this.paymobService);
  @override
  Future<Either<Failure, void>> makeStripePayment({
    CartModel? cart,
    UserModel? user,
    bool saveCard = false,
  }) async {
    try {
      await stripeService.processPayment(
        cart: cart,
        user: user,
      );
      return right(null);
    } on StripeException catch (e) {
      return left(
        ServerFailure(errMessage: e.error.message ?? 'Oops there was an error'),
      );
    } on ServerException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } on CacheException catch (e) {
      return left(ServerFailure(errMessage: e.message));
    } 
    catch (e) {
      log('error in checkoutRepoImpl.makeStripePayment ${e.toString()}');
      return left(const ServerFailure(errMessage: 'Payment Failed'));
    }
  }

  @override
  Future<Either<Failure, String>> makePaymobPayment({
    CartModel? cart,
    UserModel? user,
  }) async {
    try {
      final paymentLinkResponseModel = await paymobService.createOrder(
        cart: cart,
        user: user,
      );
      if (paymentLinkResponseModel.orderUrl != null) {
        return Right(paymentLinkResponseModel.orderUrl!);
      } else {
        return left(
          const ServerFailure(
            errMessage: 'There is a problem with paymob payment',
          ),
        );
      }
    } on ServerException catch (e) {
      log('error in checkoutRepoImpl.makePaymobPayment ${e.toString()}');
      return left(ServerFailure(errMessage: e.message));
    } catch (e) {
      log('error in checkoutRepoImpl.makePaymobPayment ${e.toString()}');
      return left(
        ServerFailure(errMessage: 'There is a problem with paymob payment'),
      );
    }
  }
}
