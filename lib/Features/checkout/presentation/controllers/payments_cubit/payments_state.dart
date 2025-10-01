part of 'payments_cubit.dart';

@immutable
sealed class PaymentsState {}

final class PaymentInitial extends PaymentsState {}

final class PaymentLoading extends PaymentsState {}

final class PaymentSuccess extends PaymentsState {
  final String? paymentLink;

  PaymentSuccess({this.paymentLink});
}

final class PaymentFailure extends PaymentsState {
  final String errMessage;

  PaymentFailure(this.errMessage);
}
