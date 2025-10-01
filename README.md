# checkout_payments

Checkout Payments is a Flutter demo app showcasing a complete checkout flow with multiple payment providers:

- Stripe Payment Sheet
- PayPal (sandbox)
- Paymob (payment link via in-app WebView)

The app uses the Repository pattern, Bloc for state management, and GetIt for dependency injection.

## Video Demo

[📺 Watch Demo Video](https://drive.google.com/file/d/1nbe1HSfOigB80ZkK_Xg9y10WCWCcIH8p/view?usp=drive_link)


## Features

- Stripe Payment Sheet integration using `flutter_stripe`
- Save card during checkout and pay later with a saved method
- List saved Stripe payment methods and select one to pay
- PayPal sandbox checkout using `flutter_paypal_payment`
- Paymob payment link flow with a built-in WebView
- Simple cart UI and a thank-you screen on success

## Tech Stack

- Flutter, Dart
- State: `flutter_bloc`
- DI: `get_it`
- Networking: `dio`
- Payments: `flutter_stripe`, `flutter_paypal_payment`, Paymob REST API

## Project Structure

```
lib/
  core/
    config/            # Payment config and endpoints
    di/                # Service locator (GetIt)
    functions/         # App initialization, helpers
    network/           # ApiService (Dio wrapper)
    services/          # Stripe, PayPal, Paymob services
    utils/             # Enums, styles, assets
    widgets/           # Shared UI widgets
  Features/checkout/
    data/              # Repository implementations
    presentation/      # Views and Bloc/Cubit controllers
  main.dart            # App entry
```

## Prerequisites

- Flutter SDK installed and configured
- Stripe account and test keys
- PayPal sandbox account (Client ID and Secret)
- Paymob account with API key and integration IDs

## Configuration

Sensitive keys are stored in `lib/core/config/secret_keys.dart` (this file is git-ignored by default):

- `stripePublishableKey`, `stripeSecretKey`
- `paypalClientId`, `paypalSecretkey`
- `paymobApiKey`, `paymobSecretKey`, and integration IDs


## Running the App

```bash
flutter pub get
flutter run
```

The default home screen is `MyCartView`, which presents a cart summary and a button to choose a payment method.

## Test Data

Stripe test cards (from `secret_keys.dart`):

- Success: `4242 4242 4242 4242`
- Failure: `4000 0000 0000 9995`

Paymob test data:

- Wallet: `01010101010` (PIN and password `123456`)
- Card: `5123 4567 8901 2346`

## Architecture Notes

- Bloc/Cubit drive UI state for payment method selection and processing.
- A repository layer encapsulates provider-specific logic.
- UI widgets compose the bottom sheet for selecting payment method and handling results.

## Security Notice

Do not ship secret keys in client apps. Use a secure backend to generate Stripe PaymentIntents, Ephemeral Keys, and Customer Sessions. The values in `secret_keys.dart` are for local testing only.

## License

This project is for educational/demo purposes. Replace test keys and flows with your production-ready backend before going live.
