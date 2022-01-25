import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentReceipt extends StatelessWidget {
  const PaymentReceipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 300,
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
                      Icons.receipt_long,
                      color: Colors.green.shade700,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Payment Receipts",
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
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 30,
                            child: Text(
                              "S/N",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 30,
                            child: Text(
                              "Session",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 160,
                            height: 30,
                            child: Text(
                              "Description",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            height: 30,
                            child: Text(
                              "Level",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 380,
                        height: 170,
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: 5,
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.3),
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return _buildReceipt(index);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildReceipt(int index) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 30,
            child: Text(
              "${index + 1}.",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
            ),
          ),
          SizedBox(
            width: 120,
            height: 30,
            child: Text(
              "2020/2021",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 160,
            height: 30,
            child: Text(
              "School Charges",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
            ),
          ),
          SizedBox(
            width: 50,
            height: 30,
            child: Text(
              "400",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: Colors.grey.shade900,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
