import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.green,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "Application Guide",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.green,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            )),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: size.width,
                child: TabBar(
                  unselectedLabelColor: Colors.green,
                  isScrollable: true,
                  physics: const BouncingScrollPhysics(),
                  labelStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green,
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Undergraduate"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text("Postgraduate"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                              "Distance Learning and Continuing Education"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      "2020/2021 SESSION PRE ADMISSION SCREENING REGISTRATION PROCEDURE",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children: [
                          const TextSpan(
                              text:
                                  "1. Visit http://portal.uniabuja.edu.ng and click on "),
                          TextSpan(
                            text: "“Click here to apply”\n",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  "2. Click Undergraduate link on the left pane\n"),
                          const TextSpan(
                              text:
                                  "3. Enter your JAMB Registration Number and Click on "),
                          TextSpan(
                            text: "“Get details”\n",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  "4. Complete the basic information page (Please note: Enter only valid phone number and email address and click next.\n"),
                          const TextSpan(
                              text: "5. On the payment review page, click on "),
                          TextSpan(
                            text: "“Generate RRR” ",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text: "and this takes you to another page\n"),
                          const TextSpan(text: "6. Click "),
                          TextSpan(
                            text: "“Submit” ",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  "and you will be redirected to remita payment page\n"),
                          const TextSpan(text: "7. Enter ATM Card "),
                          TextSpan(
                            text: "(Mastercard or Visa) ",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  "number and other details as appropriate and submit\n"),
                          const TextSpan(text: "8. Enter "),
                          TextSpan(
                            text: "“OTP code” ",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  "sent to your phone and click continue to complete your payment\n"),
                          const TextSpan(
                              text: "9. After a successful payment, click on "),
                          TextSpan(
                            text: "“Main Login” ",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  "on the portal, enter your Jamb registration number and Surname as password\n"),
                          const TextSpan(text: "10. Click on "),
                          TextSpan(
                            text: "“Login to dashboard” ",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text: "and complete your registration\n"),
                          const TextSpan(
                              text:
                                  "11. Ensure you print completed registration form, payment receipt and exam schedule\n"),
                          const TextSpan(text: "\n"),
                          TextSpan(
                            text: "NOTE: ",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  "You can always requery your payment attempt in case you have been debited and network fails while completing your payment. Enter your JAMB registration number, click "),
                          TextSpan(
                            text: "“Get details”",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  ", then requery your unsuccessful payment attempt as shown below\n"),
                          const TextSpan(text: "\n"),
                          const TextSpan(text: "For support, contact "),
                          TextSpan(
                            text: "ips.helpdesk@uniabuja.edu.ng",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      "2020/2021 CENTER FOR POSTGRADUATE APPLICATION PROCEDURE",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children: [
                          const TextSpan(
                              text: "1. Visit http://portal.uniabuja.edu.ng\n"),
                          const TextSpan(text: "2. Click on "),
                          TextSpan(
                            text: "“Click here to apply”\n",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text: "3. On the left pane, click on "),
                          TextSpan(
                            text: "Postgraduate\n",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  "4. Enter the requested details (surname, firstname, othername, email and phone number) and click "),
                          TextSpan(
                            text: "Next\n",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text: "5. On the payment review page, click on "),
                          TextSpan(
                            text: "“Generate RRR”\n",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(text: "6. Click "),
                          TextSpan(
                            text: "make payment ",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  "and you will be redirected to remita platform, enter your card details (Master Card or Visa Card)\n"),
                          const TextSpan(
                              text:
                                  "7. After a successful payment, you will be redirected back to the portal and application number generated and you will be logout out\n"),
                          const TextSpan(text: "8. Click on "),
                          TextSpan(
                            text: "“Main Login”",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  ", enter the generated application number and surname as password to continue the application process\n"),
                          const TextSpan(text: "\n"),
                          const TextSpan(text: "For support, contact "),
                          TextSpan(
                            text:
                                "ips.helpdesk@uniabuja.edu.ng OR ojo.samuel@uniabuja.edu.ng",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: size.height,
                width: size.width,
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      "2020/2021 CENTER FOR DISTANCE LEARNING APPLICATION PROCEDURE",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        children: [
                          const TextSpan(
                              text: "1. Visit http://portal.uniabuja.edu.ng\n"),
                          const TextSpan(text: "2. Click on "),
                          TextSpan(
                            text: "“Click here to apply”\n",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text: "3. On the left pane, click on "),
                          TextSpan(
                            text: "Distance Learning\n",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  "4. Enter the requested details (surname, firstname, othername, email and phone number) and click "),
                          TextSpan(
                            text: "Next\n",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text: "5. On the payment review page, click on "),
                          TextSpan(
                            text: "“Generate RRR”\n",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(text: "6. Click "),
                          TextSpan(
                            text: "make payment ",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  "and you will be redirected to remita platform, enter your card details (Master Card or Visa Card)\n"),
                          const TextSpan(
                              text:
                                  "7. After a successful payment, you will be redirected back to the portal and application number generated and you will be logout out\n"),
                          const TextSpan(text: "8. Click on "),
                          TextSpan(
                            text: "“Main Login”",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const TextSpan(
                              text:
                                  ", enter the generated application number and surname as password to continue the application process\n"),
                          const TextSpan(text: "\n"),
                          const TextSpan(text: "For support, contact "),
                          TextSpan(
                            text:
                                "ips.helpdesk@uniabuja.edu.ng OR ojo.samuel@uniabuja.edu.ng",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
