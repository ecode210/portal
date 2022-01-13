import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal/view/hostel_widgets/hostel_details.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class HostelSlot extends StatefulWidget {
  final String title;

  HostelSlot(this.title);

  @override
  _HostelSlotState createState() => _HostelSlotState();
}

class _HostelSlotState extends State<HostelSlot> {
  int room = 0;
  String block = "A";
  String price = "N25,000";
  ScrollController _scrollController = ScrollController();
  late final RoundedLoadingButtonController _loginController;

  @override
  void initState() {
    super.initState();
    _loginController = RoundedLoadingButtonController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFf5fff8),
      appBar: PreferredSize(
        preferredSize: Size(size.width, 300),
        child: Container(
          width: size.width,
          height: 300,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 300,
                width: size.width,
                child: Hero(
                  tag: widget.title,
                  child: Image.asset(
                    "assets/jpg/slide1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  height: 300,
                  width: size.width,
                  color: Colors.green.shade700.withOpacity(0.5),
                ),
              ),
              Positioned(
                top: 30,
                right: -10,
                child: Container(
                  height: 40,
                  width: size.width,
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
                        widget.title,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                )
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Color(0xFFf5fff8),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Scrollbar(
          controller: _scrollController,
          thickness: 5,
          interactive: true,
          radius: Radius.circular(10),
          child: ListView.builder(
            itemCount: 40,
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              room++;
              if (index == 20) {
                room = 1;
                block = "B";
              }
              if (widget.title.startsWith("New")) {
                price = "N25,000";
              } else if (widget.title.startsWith("Old")) {
                price = "N10,000";
              } else if (widget.title.startsWith("Mid")) {
                price = "N15,000";
              }
              return HostelDetails(
                  widget.title, block, room, price, _loginController);
            },
          ),
        ),
      ),
    );
  }
}
