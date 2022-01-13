import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:portal/view/map_widgets/location_details.dart';
import 'package:portal/viewmodel/map.dart';
import 'package:provider/provider.dart';

class MapBottomSheet extends StatefulWidget {
  @override
  _MapBottomSheetState createState() => _MapBottomSheetState();
}

class _MapBottomSheetState extends State<MapBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var map = Provider.of<SchoolMap>(context);
    return Container(
      height: size.height * 0.35,
      width: size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                width: size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                cursorColor: Colors.green.shade700,
                cursorWidth: 2,
                cursorRadius: Radius.circular(10),
                onChanged: (value){
                  map.search(value);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: "Search",
                  hintStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  prefixIcon: Icon(
                    Iconsax.search_normal,
                    color: Colors.green.shade700,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: map.locations.length,
                itemBuilder: (context, index) {
                      return LocationDetails(map.locations[index], index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
