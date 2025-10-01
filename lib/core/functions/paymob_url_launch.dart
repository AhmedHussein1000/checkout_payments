import 'dart:developer';

import 'package:checkout_payments/core/functions/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<void> launchPaymobPaymentUrl(BuildContext context, String url) async {
  try {
    if (!context.mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PaymobWebViewPage(initialUrl: url)),
    );
  } catch (e) {
    log('Error opening payment page: ${e.toString()}');
    if (!context.mounted) return;
    customSnackBar(context, 'Error opening payment page');
  }
}

class PaymobWebViewPage extends StatefulWidget {
  const PaymobWebViewPage({super.key, required this.initialUrl});
  final String initialUrl;

  @override
  State<PaymobWebViewPage> createState() => _PaymobWebViewPageState();
}

class _PaymobWebViewPageState extends State<PaymobWebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (url) {
            setState(() => _isLoading = false);
          },
          onWebResourceError: (error) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paymob Payment')),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            if (_isLoading)
              const Positioned(
                left: 0,
                right: 0,
                child: CircularProgressIndicator(color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}
