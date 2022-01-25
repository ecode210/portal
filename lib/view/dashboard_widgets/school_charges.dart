import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:portal/viewmodel/user_information.dart';
import 'package:provider/provider.dart';

class SchoolCharges extends StatelessWidget {
  const SchoolCharges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var user = Provider.of<UserInformation>(context, listen: false);
    return Container(
      height: 150,
      width: size.width,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            width: size.width,
            child: Row(
              children: [
                ClipOval(
                  child: Container(
                    height: 35,
                    width: 35,
                    color: Colors.green.withOpacity(0.1),
                    child: Icon(
                      Icons.payment_rounded,
                      color: Colors.green.shade700,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "School Charges",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.green.shade700,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              width: size.width,
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                height: 1),
                          ),
                          children: const [
                            TextSpan(
                              text: "Current Session\n",
                            ),
                            TextSpan(
                              text: "\n",
                            ),
                            TextSpan(
                              text: "School Charges\n",
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
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
                              text: "${user.currentSession}\n",
                            ),
                            const TextSpan(
                              text: "\n",
                            ),
                            TextSpan(
                              text:
                                  "N${NumberFormat.currency(symbol: "").format(user.schoolCharges)}\n",
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
