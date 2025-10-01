import 'package:checkout_payments/Features/checkout/data/repos/base_checkout_repo.dart';
import 'package:checkout_payments/core/utils/payment_method_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'payment_method_state.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  final BaseCheckoutRepo? checkoutRepo;
  
  PaymentMethodCubit({this.checkoutRepo}) : super(const PaymentMethodState());

  void selectPaymentMethod(PaymentMethod paymentMethod) {
    emit(state.copyWith(
      selectedPaymentMethod: paymentMethod,
      // // Reset saved payment method selection when changing payment method
      // selectedSavedPaymentMethodId: null,
      // useSavedPaymentMethod: false,
    ));
    
    // Load saved payment methods when Stripe is selected
    // if (paymentMethod == PaymentMethod.stripe) {
    //   loadSavedPaymentMethods();
    // }
  }
  
  // Future<void> loadSavedPaymentMethods() async {
  //   if (checkoutRepo == null) return;
    
  //   emit(state.copyWith(isLoadingSavedMethods: true));
    
  //   try {
  //     final result = await checkoutRepo!.listSavedStripeMethods( customerId: );
      
  //     result.fold(
  //       (failure) {
  //         emit(state.copyWith(
  //           isLoadingSavedMethods: false,
  //           savedPaymentMethods: [],
  //         ));
  //       },
  //       (paymentMethods) {
  //         emit(state.copyWith(
  //           isLoadingSavedMethods: false,
  //           savedPaymentMethods: paymentMethods,
  //         ));
  //       },
  //     );
  //   } catch (e) {
  //     emit(state.copyWith(
  //       isLoadingSavedMethods: false,
  //       savedPaymentMethods: [],
  //     ));
  //   }
  // }
  
  // void selectSavedPaymentMethod(String? paymentMethodId) {
  //   emit(state.copyWith(
  //     selectedSavedPaymentMethodId: paymentMethodId,
  //     useSavedPaymentMethod: paymentMethodId != null,
  //   ));
  // }
  
  // void toggleUseSavedPaymentMethod(bool value) {
  //   emit(state.copyWith(
  //     useSavedPaymentMethod: value,
  //     selectedSavedPaymentMethodId: value ? state.selectedSavedPaymentMethodId : null,
  //   ));
  // }
}
