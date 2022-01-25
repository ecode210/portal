import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal/viewmodel/user_information.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var userInfo = Provider.of<UserInformation>(context, listen: false);
    return Container(
      height: 300,
      width: size.width,
      margin: const EdgeInsets.fromLTRB(20, 150, 20, 20),
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
                      Icons.person_rounded,
                      color: Colors.green.shade700,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Basic Profile",
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
                              text: "Matriculation No.\n",
                            ),
                            TextSpan(
                              text: "\n",
                            ),
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
                              text: "Faculty\n",
                            ),
                            TextSpan(
                              text: "\n",
                            ),
                            TextSpan(
                              text: "Department\n",
                            ),
                            TextSpan(
                              text: "\n",
                            ),
                            TextSpan(
                              text: "Programme\n",
                            ),
                            TextSpan(
                              text: "\n",
                            ),
                            TextSpan(
                              text: "\n",
                            ),
                            TextSpan(
                              text: "Current Level",
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
                              text: "${userInfo.user["matric"]}\n",
                            ),
                            const TextSpan(
                              text: "\n",
                            ),
                            TextSpan(
                              text: "${userInfo.user["fullname"]}\n",
                            ),
                            const TextSpan(
                              text: "\n",
                            ),
                            TextSpan(
                              text: "${userInfo.user["faculty"]}\n",
                            ),
                            const TextSpan(
                              text: "\n",
                            ),
                            TextSpan(
                              text: "${userInfo.user["dept"]}\n",
                            ),
                            const TextSpan(
                              text: "\n",
                            ),
                            TextSpan(
                              text: "${userInfo.user["programme"]}\n",
                            ),
                            const TextSpan(
                              text: "\n",
                            ),
                            TextSpan(
                              text: "${userInfo.user["level"]}",
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
