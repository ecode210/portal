import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:portal/view/map_widgets/bottomsheet.dart';
import 'package:portal/viewmodel/map.dart';
import 'package:provider/provider.dart';

class Tour extends StatefulWidget {
  const Tour({Key? key}) : super(key: key);

  @override
  _TourState createState() => _TourState();
}

class _TourState extends State<Tour> {
  late GoogleMapController _googleMapController;
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(8.976824, 7.179293),
    bearing: 30,
    zoom: 15,
  );

  Future<String> getJsonFile(String path) async{
    return await rootBundle.loadString(path);
  }

  void setMapStyle(){
    getJsonFile("assets/map/light.json").then((mapStyle) => _googleMapController.setMapStyle(mapStyle));
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var map = Provider.of<SchoolMap>(context);
    return Scaffold(
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
                "School Tour",
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
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: size.height * 0.7,
              width: size.width,
              child: GoogleMap(
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: _initialCameraPosition,
                markers: {
                  map.facultyOfScience,
                  map.facultyOfAgric,
                  map.facultyOfEngineering,
                  map.facultyOfVetMedicine,
                  map.facultyOfMedicine,
                  map.facultyOfMngScience,
                  map.facultyOfSocScience,
                  map.facultyOfLaw,
                  map.facultyOfArt,
                  map.etf,
                  map.tetfund,
                  map.scienceTheater,
                  map.physicsComplex,
                  map.chemistryLab,
                  map.mngScienceTheater,
                  map.artTheater,
                  map.fayrouzJoint,
                  map.oldGirlsHostel,
                  map.midGirlsHostel,
                  map.newGirlsHostel,
                  map.oldBoysHostel,
                  map.newBoysHostel,
                  map.adelabuMarket,
                  map.senateBuilding,
                  map.convGround,
                  map.shuttleStand,
                  map.zenithBank,
                  map.firstBank,
                  map.clinic,
                  map.securityUnit,
                  map.library,
                  map.printingPress,
                  map.schoolGate,
                },
                onMapCreated: (controller){
                  _googleMapController = controller;
                  map.setGMC(controller);
                  setMapStyle();
                },
              ),
            ),
            Positioned(
              right: size.width * 0.02,
              top: size.width * 0.02,
              child: BouncingWidget(
                onPressed: () {
                  _googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition(_initialCameraPosition));
                },
                scaleFactor: 1.1,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.my_location_rounded,
                    color: Colors.green.shade700,
                    size: 25,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: MapBottomSheet(/*_googleMapController*/),
            ),
          ],
        ),
      ),
    );
  }
}
