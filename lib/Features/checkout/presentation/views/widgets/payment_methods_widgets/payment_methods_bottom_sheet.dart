import 'package:checkout_payments/Features/checkout/presentation/controllers/payment_method_cubit/payment_method_cubit.dart';
import 'package:checkout_payments/Features/checkout/presentation/controllers/payment_method_cubit/payment_method_state.dart';
import 'package:checkout_payments/Features/checkout/presentation/views/widgets/payment_methods_widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_payments/Features/checkout/presentation/views/widgets/payment_methods_widgets/payment_methods_list_bloc_builder.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key, required this.cart, this.user});

  final CartModel cart;
  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            const PaymentMethodsListBlocBuilder(),
            const SizedBox(height: 16),
            BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
              builder: (context, state) {
                return CustomButtonBlocConsumer(
                  paymentMethod: state.selectedPaymentMethod,
                  cart: cart,
                  user: user,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
