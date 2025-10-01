import 'package:checkout_payments/Features/checkout/data/repos/base_checkout_repo.dart';
import 'package:checkout_payments/Features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:checkout_payments/core/network/api_service.dart';
import 'package:checkout_payments/core/services/paymob_service.dart';
import 'package:checkout_payments/core/services/stripe_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() => ApiService(Dio()));
  getIt.registerLazySingleton(() => StripeService(getIt()));
  getIt.registerLazySingleton(() => PaymobService(getIt()));
  getIt.registerLazySingleton<BaseCheckoutRepo>(
    () => CheckoutRepoImpl(getIt(), getIt()),
  );
}
