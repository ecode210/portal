import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class DetailsUpdate extends StatelessWidget {
  const DetailsUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 290,
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
                      Icons.mail_rounded,
                      color: Colors.green.shade700,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Details Update",
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
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green.withOpacity(0.1),
                    ),
                    child: TextFormField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      cursorColor: Colors.green,
                      cursorWidth: 2,
                      cursorRadius: const Radius.circular(10),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Email",
                        hintStyle: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                        prefixIcon: const Icon(
                          Icons.mail_outline_rounded,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green.withOpacity(0.1),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.green,
                      cursorWidth: 2,
                      cursorRadius: const Radius.circular(10),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Phone Number",
                        hintStyle: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                        prefixIcon: const Icon(
                          Iconsax.call,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  BouncingWidget(
                    duration: const Duration(milliseconds: 100),
                    scaleFactor: 0.5,
                    onPressed: () {},
                    child: Container(
                      height: 50,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          "Update",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
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
