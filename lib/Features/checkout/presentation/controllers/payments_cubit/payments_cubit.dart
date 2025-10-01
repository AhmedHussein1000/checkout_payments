import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:checkout_payments/Features/checkout/data/repos/base_checkout_repo.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/models/user_model.dart';
import 'package:meta/meta.dart';

part 'payments_state.dart';

class PaymentsCubit extends Cubit<PaymentsState> {
  PaymentsCubit(this.checkoutRepo) : super(PaymentInitial());
  final BaseCheckoutRepo checkoutRepo;

  Future processStripePayment({
    CartModel? cart,
    UserModel? user,
  }) async {
    emit(PaymentLoading());

    final result = await checkoutRepo.makeStripePayment(
      cart: cart,
      user: user,
    );

    result.fold(
      (failure) => emit(PaymentFailure(failure.errMessage)),
      (r) => emit(PaymentSuccess()),
    );
  }


  Future processPaymobPayment({
    CartModel? cart,
    UserModel? user,
  }) async {
    emit(PaymentLoading());

    final result = await checkoutRepo.makePaymobPayment(
      cart: cart,
      user: user,
    );

    result.fold(
      (failure) => emit(PaymentFailure(failure.errMessage)),
      (paymentLink) => emit(PaymentSuccess(paymentLink: paymentLink)),
    );
  }

  @override
  void onChange(Change<PaymentsState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
