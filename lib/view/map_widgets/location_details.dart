import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal/viewmodel/map.dart';
import 'package:provider/provider.dart';

class LocationDetails extends StatefulWidget {
  final String location, image;
  final int index;

  const LocationDetails(this.location, this.index, this.image, {Key? key})
      : super(key: key);

  @override
  _LocationDetailsState createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  @override
  Widget build(BuildContext context) {
    var map = Provider.of<SchoolMap>(context);
    return InkWell(
      onTap: () {
        map.refresh(widget.index);
      },
      child: AspectRatio(
        aspectRatio: 1.0 / 1.1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: double.infinity,
          margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          decoration: BoxDecoration(
            color: map.isSelected[widget.index]
                ? Colors.green.shade700
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: map.isSelected[widget.index]
                  ? Colors.transparent
                  : Colors.grey.shade100,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.location,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: map.isSelected[widget.index]
                              ? Colors.white
                              : Colors.grey.shade600,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          height: 1.2),
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
