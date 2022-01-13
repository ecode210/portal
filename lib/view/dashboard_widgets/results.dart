import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  String _firstValue = "2020/2021 || 400 Level";
  String _secondValue = "First Semester";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 300,
      width: size.width,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: EdgeInsets.all(20),
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
          Container(
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
                      Icons.bar_chart_rounded,
                      color: Colors.green.shade700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Results",
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
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: size.width,
              child: Column(
                children: [
                  DropdownButton<String>(
                    focusColor: Colors.green,
                    value: _firstValue,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )),
                    iconEnabledColor: Colors.green,
                    items: [
                      "2020/2021 || 400 Level",
                      "2019/2020 || 300 Level",
                      "2018/2019 || 200 Level",
                      "2017/2018 || 100 Level",
                    ].map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      );
                    }).toList(),
                    elevation: 0,
                    dropdownColor: Colors.green.shade50,
                    onChanged: (value) {
                      setState(() {
                        _firstValue = value!;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  DropdownButton<String>(
                    focusColor: Colors.green,
                    value: _secondValue,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.grey.shade900,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        )),
                    iconEnabledColor: Colors.green,
                    items: [
                      "First Semester",
                      "Second Semester",
                      "Both Semesters",
                    ].map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.grey.shade900,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      );
                    }).toList(),
                    elevation: 0,
                    dropdownColor: Colors.green.shade50,
                    onChanged: (value) {
                      setState(() {
                        _secondValue = value!;
                      });
                    },
                  ),
                  SizedBox(height: 15),
                  BouncingWidget(
                    duration: Duration(milliseconds: 100),
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
                          "Display Results",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                              )
                          ),
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