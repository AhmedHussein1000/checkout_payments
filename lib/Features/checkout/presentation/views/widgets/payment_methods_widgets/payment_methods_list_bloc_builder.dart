import 'package:checkout_payments/Features/checkout/presentation/controllers/payment_method_cubit/payment_method_cubit.dart';
import 'package:checkout_payments/Features/checkout/presentation/controllers/payment_method_cubit/payment_method_state.dart';
import 'package:checkout_payments/core/utils/payment_method_enum.dart';
import 'package:checkout_payments/Features/checkout/presentation/views/widgets/payment_methods_widgets/payment_method_item.dart';
import 'package:checkout_payments/core/helpers/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodsListBlocBuilder extends StatelessWidget {
  const PaymentMethodsListBlocBuilder({super.key});

  final List<String> paymentMethodsImages = const [
    Assets.imagesStripe,
    Assets.imagesPaypal,
    Assets.imagesPaymob,
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
      builder: (context, state) {
        return SizedBox(
          height: 62,
          child: ListView.builder(
            itemCount: paymentMethodsImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final paymentMethod = paymentMethodFromIndex(index);
              final isActive = state.selectedPaymentMethod == paymentMethod;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    context.read<PaymentMethodCubit>().selectPaymentMethod(
                      paymentMethod,
                    );
                  },
                  child: PaymentMethodItem(
                    isActive: isActive,
                    image: paymentMethodsImages[index],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
