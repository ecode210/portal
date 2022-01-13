import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Login extends ChangeNotifier {


  final sliderImages = [
    Image.asset(
      "assets/jpg/slide1.jpg",
      fit: BoxFit.fitHeight,
    ),
    Image.asset(
      "assets/jpg/slide2.jpg",
      fit: BoxFit.fitHeight,
    ),
    Image.asset(
      "assets/jpg/slide3.jpg",
      fit: BoxFit.fitHeight,
    ),
  ];

  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection(
      "portal").snapshots();

  final localAuth = LocalAuthentication();
  bool hasFingerprint = true;

  Future<bool> hasBiometrics() async {
    try {
      hasFingerprint = true;
      return localAuth.canCheckBiometrics;
    } on PlatformException catch (e) {
      hasFingerprint = false;
      print(e.toString());
      return false;
    }
  }

  Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await localAuth.authenticate(
        localizedReason: "Scan Fingerprint to Login",
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e.toString());
      return false;
    }
  }

  int drawerNumber = 0;

}