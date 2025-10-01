import 'package:checkout_payments/core/utils/payment_method_enum.dart';
import 'package:equatable/equatable.dart';

class PaymentMethodState extends Equatable {
  final PaymentMethod selectedPaymentMethod;

  const PaymentMethodState({
    this.selectedPaymentMethod = PaymentMethod.stripe,

  });

  PaymentMethodState copyWith({
    PaymentMethod? selectedPaymentMethod,

  }) {
    return PaymentMethodState(
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,

    );
  }

  @override
  List<Object?> get props => [
    selectedPaymentMethod, 
  ];
}
