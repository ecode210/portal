import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';

class FlutterwavePayment {
  final BuildContext context;
  final int price;
  final String email;

  FlutterwavePayment({
    required this.context,
    required this.price,
    required this.email,
  });

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  makePayment() async {
    final Flutterwave flutterwave = Flutterwave.forUIPayment(
      context: context,
      encryptionKey: "FLWSECK_TEST51277c9d58d2",
      publicKey: "FLWPUBK_TEST-ad2f667124408fe366b7f075d42dc571-X",
      currency: "NGN",
      amount: price.toString(),
      email: email,
      fullName: "Oyedele Emmanuel Olawole",
      txRef: _getReference(),
      isDebugMode: true,
      phoneNumber: "0123456789",
      acceptCardPayment: true,
      acceptUSSDPayment: true,
      acceptAccountPayment: true,
      acceptFrancophoneMobileMoney: false,
      acceptGhanaPayment: false,
      acceptMpesaPayment: false,
      acceptRwandaMoneyPayment: false,
      acceptUgandaPayment: false,
      acceptZambiaPayment: false,
    );

    try {
      final ChargeResponse response =
          await flutterwave.initializeForUiPayments();
      if (response == null) {
        print("Transaction failed!");
      } else {
        if (response.status == "success") {
          print(response.message);
          print(response.status);
        } else {
          print(response.message);
        }
      }
    } catch (error) {
      print(error);
    }
  }
}
