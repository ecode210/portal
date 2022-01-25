import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:websafe_svg/websafe_svg.dart';

class PaystackPayment {
  final BuildContext context;
  final int price;
  final String email;

  PaystackPayment({
    required this.context,
    required this.price,
    required this.email,
  });

  PaystackPlugin paystack = PaystackPlugin();

  Future _initializePlugin() async {
    await paystack.initialize(
        publicKey: "pk_test_d2fd987d60a06704990f7e3cadbb22b1d50b524a");
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }
    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardUI() {
    return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
  }

  makePayment() async {
    try {
      _initializePlugin().then((_) async {
        Charge charge = Charge()
          ..amount = price * 100
          ..email = email
          ..reference = _getReference()
          ..card = _getCardUI();

        CheckoutResponse response = await paystack.checkout(
          context,
          charge: charge,
          method: CheckoutMethod.card,
          fullscreen: false,
          logo: SizedBox(
            height: 30,
            width: 30,
            child: WebsafeSvg.asset(
              "assets/svg/uniabuja.svg",
              fit: BoxFit.fitHeight,
            ),
          ),
        );

        print("Response $response");

        if (response.status == true) {
          print("Transaction successful");
        } else {
          print("Transaction failed");
        }
      });
    } catch (e) {
      print("ERROR THROWN!!!");
    }
  }
}
