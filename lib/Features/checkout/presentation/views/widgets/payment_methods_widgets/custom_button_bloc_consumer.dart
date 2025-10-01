import 'package:checkout_payments/Features/checkout/presentation/controllers/payments_cubit/payments_cubit.dart';
import 'package:checkout_payments/core/utils/payment_method_enum.dart';
import 'package:checkout_payments/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_payments/core/functions/paymob_url_launch.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/models/user_model.dart';
import 'package:checkout_payments/core/services/paypal_service.dart';
import 'package:checkout_payments/core/widgets/custom_button.dart';
import 'package:checkout_payments/core/functions/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBlocConsumer extends StatefulWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.paymentMethod,
    required this.cart,
    this.user,
  });

  final PaymentMethod paymentMethod;
  final CartModel cart;
  final UserModel? user;
  

  @override
  State<CustomButtonBlocConsumer> createState() =>
      _CustomButtonBlocConsumerState();
}

class _CustomButtonBlocConsumerState extends State<CustomButtonBlocConsumer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentsCubit, PaymentsState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          if (state.paymentLink != null) {
            launchPaymobPaymentUrl(context, state.paymentLink!);
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) {
                  return ThankYouView(cart: widget.cart, user: widget.user);
                },
              ),
            );
          }
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            switch (widget.paymentMethod) {
              case PaymentMethod.stripe:
                  context.read<PaymentsCubit>().processStripePayment(
                    cart: widget.cart,
                    user: widget.user,
                  );
                break;
              case PaymentMethod.paypal:
                PaypalService.processPaypalPayment(context, cart: widget.cart);
                break;
              case PaymentMethod.paymob:
                context.read<PaymentsCubit>().processPaymobPayment(
                  cart: widget.cart,
                  user: widget.user,
                );
                break;
            }
          },
          isLoading: state is PaymentLoading,
          text:'Continue',
        );
      },
    );
  }
}
