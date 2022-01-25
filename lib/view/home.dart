import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';
import 'package:portal/view/custom_page_route.dart';
import 'package:portal/view/dashboard.dart';
import 'package:portal/view/register.dart';
import 'package:portal/viewmodel/login.dart';
import 'package:portal/viewmodel/user_information.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final RoundedLoadingButtonController _loginController;
  final GlobalKey _sliderKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    _loginController = RoundedLoadingButtonController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.green.shade700,
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Flexible(
                flex: 5,
                child: Stack(
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.height,
                    ),
                    Positioned(
                      top: 0,
                      child: SizedBox(
                        width: size.width,
                        height: size.height,
                        child: CarouselSlider.builder(
                          key: _sliderKey,
                          unlimitedMode: true,
                          enableAutoSlider: true,
                          autoSliderDelay: const Duration(seconds: 5),
                          autoSliderTransitionTime:
                              const Duration(milliseconds: 200),
                          slideBuilder: (index) {
                            final sliderImage =
                                Provider.of<Login>(context, listen: false)
                                    .sliderImages[index];
                            return Container(
                              alignment: Alignment.topCenter,
                              child: Stack(
                                children: [
                                  sliderImage,
                                  Container(
                                    height: double.infinity,
                                    width: size.width,
                                    color:
                                        Colors.green.shade700.withOpacity(0.5),
                                  ),
                                ],
                              ),
                            );
                          },
                          slideTransform: const DefaultTransform(),
                          itemCount: 3,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      child: Container(
                        width: size.width,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      child: SizedBox(
                        height: 200,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AnimationConfiguration.staggeredList(
                              position: 0,
                              duration: const Duration(seconds: 1),
                              delay: const Duration(seconds: 3),
                              child: SlideAnimation(
                                verticalOffset: -50,
                                child: FadeInAnimation(
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: WebsafeSvg.asset(
                                      "assets/svg/uniabuja.svg",
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AnimationConfiguration.staggeredList(
                              position: 1,
                              duration: const Duration(seconds: 1),
                              child: SlideAnimation(
                                verticalOffset: -50,
                                child: FadeInAnimation(
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "UNIVERSITY OF ABUJA\n",
                                        style: GoogleFonts.benchNine(
                                            textStyle: TextStyle(
                                          color: Colors.green.shade700,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900,
                                        )),
                                      ),
                                      TextSpan(
                                        text: "Integrated Portal",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: Colors.red.shade600,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.italic,
                                                height: 1)),
                                      )
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      size.width * 0.12, 10, size.width * 0.12, 0),
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          AnimationConfiguration.staggeredList(
                            position: 2,
                            duration: const Duration(seconds: 1),
                            child: SlideAnimation(
                              verticalOffset: -50,
                              child: FadeInAnimation(
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.grey.shade100,
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: const TextInputType
                                          .numberWithOptions(),
                                      cursorColor: Colors.green.shade700,
                                      cursorWidth: 2,
                                      cursorRadius: const Radius.circular(10),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: "Matric No.",
                                        hintStyle: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 15),
                                        prefixIcon: Icon(
                                          Iconsax.user,
                                          color: Colors.green.shade700,
                                          size: 20,
                                        ),
                                      ),
                                      onSaved: (value) => setState(() {
                                        username = value!;
                                      }),
                                      validator: (value) {
                                        if (value!.length >= 7 &&
                                            value.length <= 12) {
                                          return null;
                                        } else {
                                          return "Incorrect Matric number";
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AnimationConfiguration.staggeredList(
                            position: 3,
                            duration: const Duration(seconds: 1),
                            child: SlideAnimation(
                              verticalOffset: -50,
                              child: FadeInAnimation(
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.grey.shade100,
                                      ),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      cursorColor: Colors.green.shade700,
                                      cursorWidth: 2,
                                      cursorRadius: const Radius.circular(10),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 15),
                                        prefixIcon: Icon(
                                          Iconsax.key,
                                          color: Colors.green.shade700,
                                          size: 20,
                                        ),
                                      ),
                                      onSaved: (value) => setState(() {
                                        password = value!;
                                      }),
                                      validator: (value) {
                                        if (value!.length > 4) {
                                          return null;
                                        } else {
                                          return "Invalid Password";
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AnimationConfiguration.staggeredList(
                            position: 4,
                            duration: const Duration(seconds: 1),
                            child: SlideAnimation(
                              verticalOffset: -50,
                              child: FadeInAnimation(
                                child: SizedBox(
                                  width: size.width,
                                  height: 20,
                                  child: Text(
                                    "Forgot Password?",
                                    textAlign: TextAlign.end,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.green.shade700,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: Provider.of<Login>(context).users,
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return AnimationConfiguration.staggeredList(
                                position: 5,
                                duration: const Duration(seconds: 1),
                                child: SlideAnimation(
                                  verticalOffset: -50,
                                  child: FadeInAnimation(
                                    child: RoundedLoadingButton(
                                      color: Colors.green.shade700,
                                      successColor: Colors.green.shade700,
                                      resetDuration: const Duration(seconds: 4),
                                      resetAfterDuration: true,
                                      elevation: 0,
                                      controller: _loginController,
                                      onPressed: () async {
                                        if (validateAndSave()) {
                                          if (snapshot.hasData) {
                                            final data = snapshot.requireData;
                                            bool isSignedIn = false;
                                            for (int index = 0;
                                                index < data.size;
                                                index++) {
                                              if (username ==
                                                      data.docs[index]
                                                          ["matric"] &&
                                                  password ==
                                                      data.docs[index]
                                                          ["password"]) {
                                                print("Signed In!");
                                                isSignedIn = true;
                                                Provider.of<UserInformation>(
                                                        context,
                                                        listen: false)
                                                    .userIndex = index;
                                                Provider.of<UserInformation>(
                                                        context,
                                                        listen: false)
                                                    .user = data.docs[index];
                                                Hive.box("portal").put(
                                                    "user", data.docs[index]);

                                                if (Hive.box("portal")
                                                        .get("biometrics") ==
                                                    null) {
                                                  Hive.box("portal")
                                                      .put("userIndex", index);
                                                  Hive.box("portal").put(
                                                      "user", data.docs[index]);
                                                }

                                                Timer(
                                                  const Duration(seconds: 2),
                                                  () {
                                                    _loginController.success();
                                                    Timer(
                                                      const Duration(
                                                          seconds: 1),
                                                      () {
                                                        Navigator
                                                            .pushReplacement(
                                                          context,
                                                          CustomPageRoute(
                                                            const Dashboard(),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              }
                                            }
                                            if (!isSignedIn) {
                                              Fluttertoast.showToast(
                                                msg: "Incorrect details",
                                                toastLength: Toast.LENGTH_LONG,
                                                gravity: ToastGravity.TOP,
                                                backgroundColor: Colors.white,
                                                textColor:
                                                    Colors.green.shade700,
                                                fontSize: 12,
                                              );
                                              _loginController.error();
                                            }
                                          } else if (snapshot.hasError) {
                                            print("Sign in error");
                                            Timer(
                                              const Duration(seconds: 2),
                                              () {
                                                _loginController.error();
                                              },
                                            );
                                          } else {}
                                        } else {
                                          _loginController.error();
                                        }
                                      },
                                      child: Text(
                                        "Login",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AnimationConfiguration.staggeredList(
                            position: 6,
                            duration: const Duration(seconds: 1),
                            child: SlideAnimation(
                              verticalOffset: -50,
                              child: FadeInAnimation(
                                child: SizedBox(
                                  width: size.width,
                                  height: 20,
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "New Application? ",
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                            text: "Click here to Apply",
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                color: Colors.green.shade700,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                  context,
                                                  CustomPageRoute(Register()),
                                                );
                                              }),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: Provider.of<Login>(context).users,
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return AnimationConfiguration.staggeredList(
                                position: 7,
                                duration: const Duration(seconds: 1),
                                child: SlideAnimation(
                                  verticalOffset: -50,
                                  child: FadeInAnimation(
                                    child: Consumer<Login>(
                                      builder: (context, login, child) {
                                        if (Hive.box("portal")
                                                .get("biometrics") ==
                                            null) {
                                          Hive.box("portal")
                                              .put("biometrics", false);
                                        }

                                        return IconButton(
                                          onPressed: Hive.box("portal")
                                                  .get("biometrics")
                                              ? () async {
                                                  bool isAuthenticated =
                                                      await login
                                                          .authenticate();
                                                  if (isAuthenticated &&
                                                      snapshot.hasData) {
                                                    print(
                                                        "Fingerprint Authenticated!");
                                                    var data =
                                                        snapshot.requireData;
                                                    Provider.of<UserInformation>(
                                                                context,
                                                                listen: false)
                                                            .userIndex =
                                                        Hive.box("portal")
                                                            .get("userIndex");
                                                    Provider.of<UserInformation>(
                                                            context,
                                                            listen: false)
                                                        .user = data
                                                            .docs[
                                                        Hive.box("portal")
                                                            .get("userIndex")];
                                                    Hive.box("portal").put(
                                                        "user",
                                                        data.docs[Hive.box(
                                                                "portal")
                                                            .get("userIndex")]);
                                                    Navigator.pushReplacement(
                                                        context,
                                                        CustomPageRoute(
                                                            const Dashboard()));
                                                  } else {
                                                    print(
                                                        "Fingerprint not Authorized!");
                                                  }
                                                }
                                              : () {
                                                  Fluttertoast.showToast(
                                                    msg:
                                                        "Fingerprint not Enabled!",
                                                    toastLength:
                                                        Toast.LENGTH_LONG,
                                                    gravity: ToastGravity.TOP,
                                                    backgroundColor:
                                                        Colors.white,
                                                    textColor:
                                                        Colors.green.shade700,
                                                    fontSize: 12,
                                                  );
                                                },
                                          padding: EdgeInsets.zero,
                                          icon: Icon(
                                            Icons.fingerprint_rounded,
                                            color: login.hasFingerprint &&
                                                    Hive.box("portal")
                                                        .get("biometrics")
                                                ? Colors.green.shade700
                                                : Colors.grey,
                                            size: 50,
                                          ),
                                          alignment: Alignment.center,
                                          splashColor: Colors.green.shade100,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
