import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal/viewmodel/map.dart';
import 'package:provider/provider.dart';

class LocationDetails extends StatefulWidget {
  final String location;
  final int index;

  LocationDetails(this.location, this.index);

  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {

  @override
  Widget build(BuildContext context) {
    var map = Provider.of<SchoolMap>(context);
    return InkWell(
      onTap: (){
        map.refresh(widget.index);
      },
      child: AspectRatio(
        aspectRatio: 1.0 / 1.1,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: double.infinity,
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          decoration: BoxDecoration(
            color: map.isSelected[widget.index] ? Colors.green.shade700 : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: map.isSelected[widget.index] ? Colors.transparent : Colors.grey.shade100,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/jpg/slide1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    widget.location,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: map.isSelected[widget.index] ? Colors.white : Colors.grey.shade600,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          height: 1.2
                      ),
                    ),
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
