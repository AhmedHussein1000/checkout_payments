import 'package:checkout_payments/Features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:checkout_payments/Features/checkout/presentation/controllers/payments_cubit/payments_cubit.dart';
import 'package:checkout_payments/Features/checkout/presentation/controllers/payment_method_cubit/payment_method_cubit.dart';
import 'package:checkout_payments/Features/checkout/presentation/views/widgets/my_cart_view_widgets/cart_info_item.dart';
import 'package:checkout_payments/Features/checkout/presentation/views/widgets/payment_methods_widgets/payment_methods_bottom_sheet.dart';
import 'package:checkout_payments/Features/checkout/presentation/views/widgets/total_price_widget.dart';
import 'package:checkout_payments/core/di/service_locator.dart';
import 'package:checkout_payments/core/helpers/assets.dart';
import 'package:checkout_payments/core/models/cart_model.dart';
import 'package:checkout_payments/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key, this.cart});
  final CartModel? cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset(Assets.imagesBasketImage)),
          const SizedBox(height: 25),
          OrderInfoItem(
            title: 'Order Subtotal',
            value: '${cart?.subtotal.toStringAsFixed(2)} ${cart?.currency}',
          ),
          const SizedBox(height: 3),
          OrderInfoItem(
            title: 'Discount',
            value: '${cart?.discount.toStringAsFixed(2)} ${cart?.currency}',
          ),
          const SizedBox(height: 3),
          OrderInfoItem(
            title: 'Shipping',
            value: '${cart?.shipping.toStringAsFixed(2)} ${cart?.currency}',
          ),
          const Divider(thickness: 2, height: 34, color: Color(0xffC7C7C7)),
          TotalPrice(
            title: 'Total',
            value: '${cart?.total.toStringAsFixed(2)} ${cart?.currency}',
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              _showPaymentsBottomSheet(
                context,
                cart ??
                    const CartModel(
                      subtotal: 0,
                      discount: 0,
                      shipping: 0,
                      items: []
                    ),
              );
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Future<dynamic> _showPaymentsBottomSheet(
    BuildContext context,
    CartModel cartData,
  ) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      builder: (context) {
        final checkoutRepo = CheckoutRepoImpl(getIt(), getIt());
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => PaymentsCubit(checkoutRepo)),
            BlocProvider(
              create: (context) =>
                  PaymentMethodCubit(checkoutRepo: checkoutRepo),
            ),
          ],
          child: PaymentMethodsBottomSheet(cart: cartData),
        );
      },
    );
  }
}
