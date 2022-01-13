import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal/view/hostel_widgets/hostel_slot.dart';

class Hostels extends StatelessWidget {
  final String title;

  Hostels(this.title);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HostelSlot(title)),
          );
        },
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            color: Colors.green.shade700,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: size.height,
                width: size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: title,
                    child: Image.asset(
                      "assets/jpg/slide1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.green.shade700,
                        Colors.transparent,
                      ],
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(20),
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
