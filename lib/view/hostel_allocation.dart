import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal/view/hostel_widgets/hostels.dart';
import 'package:portal/viewmodel/user_information.dart';
import 'package:provider/provider.dart';

class HostelAllocation extends StatefulWidget {
  const HostelAllocation({Key? key}) : super(key: key);

  @override
  _HostelAllocationState createState() => _HostelAllocationState();
}

class _HostelAllocationState extends State<HostelAllocation> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFf5fff8),
      appBar: PreferredSize(
        preferredSize: Size(size.width, 90),
        child: Container(
          width: size.width,
          height: 90,
          color: Colors.green.shade700,
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
                "Hostel Allocation",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(20),
        child: Provider.of<UserInformation>(context, listen: false)
                    .user["gender"] == "M"
            ? Column(
                children: [
                  Hostels("New Boys Hostel"),
                  SizedBox(
                    height: 10,
                  ),
                  Hostels("Old Boys Hostel"),
                ],
              )
            : Column(
                children: [
                  Hostels("New Girls Hostel"),
                  SizedBox(
                    height: 10,
                  ),
                  Hostels("Old Girls Hostel"),
                  SizedBox(
                    height: 10,
                  ),
                  Hostels("Mid Girls Hostel"),
                ],
              ),
      ),
    );
  }
}
