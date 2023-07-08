import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
class StripeHelper {
  static StripeHelper instance = StripeHelper();
  Map<String, dynamic>? paymentIntent;

  Future<bool> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');

      var gpay = const PaymentSheetGooglePay(
        merchantCountryCode: "USD",
        currencyCode: "USD",
        testEnv: true,
      );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: 'Vhuhulwi Technologies',
          googlePay: gpay,
        ),
      );

      displayPaymentSheet();
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer sk_test_51NRNACI1ogrgG1NqeIY32Ad6TkqReB8wdMTE7gQlID2R1RNK35VQHTGYCjM3QlgoWXPdLwOMW9p5a9MUJGL0hrPf00rRoYNVLO',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        return responseData;
      } else {
        print('Payment Intent Request Failed. Status Code: ${response.statusCode}');
        throw Exception('Payment Intent Request Failed');
      }
    } catch (err) {
      print('Error creating payment intent: $err');
      throw Exception(err.toString());
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        print("Payment Successful");
      });
    } catch (e) {
      print('$e');
    }
  }
}
