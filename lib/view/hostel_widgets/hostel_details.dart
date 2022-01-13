import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class HostelDetails extends StatefulWidget {
  final String title;
  final String block;
  final int room;
  final String price;
  final RoundedLoadingButtonController loginController;

  HostelDetails(this.title, this.block, this.room, this.price, this.loginController);

  @override
  _HostelDetailsState createState() => _HostelDetailsState();
}

class _HostelDetailsState extends State<HostelDetails>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.3),
          transitionBuilder: (context, a1, a2, widget) {
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  elevation: 0,
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 5),
                  ),
                  title: Text(
                    "CONFIRM BOOKING",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: Colors.green.shade700,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  content: Container(
                    width: size.width,
                    height: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "You are about to book ${this.widget.title.toUpperCase()} Block ${this.widget.block} Room ${this.widget.room}",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.grey.shade900,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          this.widget.price,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Colors.green.shade700,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        RoundedLoadingButton(
                          color: Colors.green.shade700,
                          successColor: Colors.green.shade700,
                          elevation: 0,
                          controller: this.widget.loginController,
                          onPressed: () {
                            Timer(
                              Duration(seconds: 2),
                              () {
                                this.widget.loginController.success();
                                Timer(
                                  Duration(seconds: 1),
                                  () {
                                    Navigator.pop(context);
                                    showGeneralDialog(
                                      barrierColor:
                                          Colors.black.withOpacity(0.3),
                                      transitionBuilder:
                                          (context, a1, a2, widget) {
                                        return Transform.scale(
                                          scale: a1.value,
                                          child: Opacity(
                                            opacity: a1.value,
                                            child: AlertDialog(
                                              shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 5),
                                              ),
                                              content: Container(
                                                width: size.width,
                                                height: 160,
                                                alignment: Alignment.center,
                                                child: Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: size.width,
                                                      height: 160,
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "BOOKED",
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                            color: Colors.green.shade800
                                                                .withOpacity(
                                                                    0.2),
                                                            fontSize: 50,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      left: size.width * 0.17,
                                                      child: Lottie.asset(
                                                        'assets/svg/star.json',
                                                        height: 150,
                                                        width: 150,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      transitionDuration:
                                          Duration(milliseconds: 200),
                                      barrierDismissible: true,
                                      barrierLabel: '',
                                      context: context,
                                      pageBuilder:
                                          (context, animation1, animation2) {
                                        return SizedBox();
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: Text(
                            "BOOK",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          transitionDuration: Duration(milliseconds: 200),
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {
            return SizedBox();
          },
        );
      },
      child: Container(
        height: 50,
        width: size.width,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${widget.title.toUpperCase()} Block ${widget.block} Room ${widget.room}",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              widget.price,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.green.shade700,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
