import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:portal/model/flutterwave_payment.dart';
import 'package:portal/model/paystack_payment.dart';
import 'package:portal/viewmodel/user_information.dart';
import 'package:provider/provider.dart';
import 'package:websafe_svg/websafe_svg.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({Key? key}) : super(key: key);

  @override
  _PaymentSectionState createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  int _currentStep = 0;
  String _firstValue = "Convocation Fee";
  List<bool> _paymentToggle = [true, false];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user = Provider.of<UserInformation>(context, listen: false);
    void _price() {
      switch (_firstValue) {
        case "Convocation Fee":
          user.paymentPrice = 5000;
          break;
        case "Old Late Registration":
          user.paymentPrice = 5000;
          break;
        case "Proficiency":
          user.paymentPrice = 1000;
          break;
        case "Transcript":
          user.paymentPrice = 10000;
          break;
        case "Undergraduate Certificate Fee":
          user.paymentPrice = 10000;
          break;
        case "Verification":
          user.paymentPrice = 5000;
          break;
        case "Change of Institution":
          user.paymentPrice = 80000;
          break;
        case "Change of Admission/Course":
          user.paymentPrice = 20000;
          break;
        case "Pre-Admission Screening Fee":
          user.paymentPrice = 2000;
          break;
        default:
          break;
      }
    }

    List<Step> _steps = [
      Step(
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        title: Text(
          "Payment Selection",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          )),
        ),
        content: Container(
          width: size.width,
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Text(
                    "Amount:",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    child: Text(
                      "N ${NumberFormat.currency(symbol: "").format(user.paymentPrice).toString()}",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: 300,
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: DropdownButton<String>(
                  focusColor: Colors.green.shade700,
                  value: _firstValue,
                  iconEnabledColor: Colors.green.shade700,
                  items: [
                    "Convocation Fee",
                    "Late Registration",
                    "Proficiency",
                    "Transcript",
                    "Undergraduate Certificate Fee",
                    "Verification",
                    "Change of Institution",
                    "Change of Admission/Course",
                    "Pre-Admission Screening Fee",
                  ].map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  elevation: 0,
                  dropdownColor: Colors.green.shade50,
                  onChanged: (value) {
                    print(NumberFormat.currency(symbol: "").format(1234567));
                    setState(() {
                      _firstValue = value!;
                      _price();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      Step(
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        title: Text(
          "Payment Preview",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          )),
        ),
        content: Container(
          width: size.width,
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: RichText(
                    text: TextSpan(
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                        children: [
                          TextSpan(
                            text: "Full Name\n",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "Matric No.\n",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "Payment Type\n",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          if (_firstValue == "Undergraduate Certificate Fee" ||
                              _firstValue == "Change of Admission/Course" ||
                              _firstValue == "Pre-Admission Screening Fee")
                            TextSpan(
                              text: "\n",
                            ),
                          TextSpan(
                            text: "Amount\n",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "Platform Fee\n",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "Total Amount",
                          ),
                        ]),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: RichText(
                    text: TextSpan(
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              height: 1),
                        ),
                        children: [
                          TextSpan(
                            text: "OYEDELE, Emmanuel Olawole\n",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "17283020\n",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "$_firstValue\n",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text:
                                "N ${NumberFormat.currency(symbol: "").format(user.paymentPrice)}\n",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text: "N 150.00\n",
                          ),
                          TextSpan(
                            text: "\n",
                          ),
                          TextSpan(
                            text:
                                "N ${NumberFormat.currency(symbol: "").format(user.paymentPrice + 150)}",
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Step(
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        title: Text(
          "Make Payment",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          )),
        ),
        content: Container(
          width: size.width,
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ToggleButtons(
                  children: [
                    Container(
                      height: size.width * 0.15,
                      width: size.width * 0.15,
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: WebsafeSvg.asset(
                        "assets/svg/paystack.svg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      height: size.width * 0.15,
                      width: size.width * 0.15,
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      child: WebsafeSvg.asset(
                        "assets/svg/flutterwave.svg",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                  isSelected: _paymentToggle,
                  fillColor: Colors.green.shade700,
                  borderRadius: BorderRadius.circular(50),
                  renderBorder: false,
                  onPressed: (int newIndex) {
                    setState(() {
                      for (int index = 0;
                          index < _paymentToggle.length;
                          index++) {
                        if (index == newIndex) {
                          _paymentToggle[index] = true;
                        } else {
                          _paymentToggle[index] = false;
                        }
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFFf5fff8),
      appBar: PreferredSize(
        preferredSize: Size(size.width, 70),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              color: Colors.green,
              width: size.width,
              height: double.infinity,
            ),
            Positioned(
              bottom: -130,
              left: -100,
              child: Center(
                child: ClipOval(
                  child: Container(
                    width: size.width + 200,
                    height: 500,
                    color: Colors.green.shade700,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: size.width,
                height: 100,
                padding: EdgeInsets.fromLTRB(10, 20, 20, 0),
                child: Row(
                  children: [
                    BouncingWidget(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: ClipOval(
                        child: Container(
                          height: 40,
                          width: 40,
                          color: Colors.white,
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.green.shade700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Payment Section",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 100,
              child: Container(
                height: 180,
                width: size.width,
                child: WebsafeSvg.asset(
                  "assets/svg/payment.svg",
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 200),
        child: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(primary: Colors.green.shade700)),
          child: Stepper(
            steps: _steps,
            currentStep: _currentStep,
            elevation: 0,
            physics: BouncingScrollPhysics(),
            onStepTapped: (step) {
              setState(() {
                _currentStep = step;
              });
            },
            onStepContinue: () {
              final isLastStep = _currentStep == _steps.length - 1;

              if (isLastStep) {
                if (_paymentToggle[0]) {
                  PaystackPayment(
                    context: context,
                    price: user.paymentPrice + 150,
                    email: user.email,
                  ).makePayment();
                } else if (_paymentToggle[1]) {
                  FlutterwavePayment(
                    context: context,
                    price: user.paymentPrice + 150,
                    email: user.email,
                  ).makePayment();
                }
              } else {
                setState(() {
                  _currentStep += 1;
                });
              }
            },
            onStepCancel: () {
              if (_currentStep != 0) {
                setState(() {
                  _currentStep -= 1;
                });
              }
            },
            controlsBuilder: (context, controls) {
              return Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: controls.onStepContinue,
                      child: Container(
                        height: 35,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.green.shade700,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            _currentStep != 2 ? "Next" : "Pay",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    if (_currentStep != 0)
                      GestureDetector(
                        onTap: controls.onStepCancel,
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.green.shade700.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "Back",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.green.shade700,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
