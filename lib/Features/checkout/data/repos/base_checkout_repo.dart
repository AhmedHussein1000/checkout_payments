import 'package:checkout_payments/core/errors/failures.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseCheckoutRepo {
  Future<Either<Failure, void>> makeStripePayment({
    CartModel? cart,
    UserModel? user,
  });
  Future<Either<Failure, String>> makePaymobPayment({
    CartModel? cart,
    UserModel? user,
  });
}
