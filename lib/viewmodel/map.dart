import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SchoolMap extends ChangeNotifier {
  GoogleMapController? googleMapController;
  void setGMC(GoogleMapController controller) {
    googleMapController = controller;
  }

  List locationImages = [
    "assets/jpg/senate building.jpg",
    "assets/jpg/convocation ground.jpg",
    "assets/jpg/etf.jpg",
    "assets/jpg/management science theater.jpg",
    "assets/jpg/adelabu market.jpg",
    "assets/jpg/library.jpg",
    "assets/jpg/science theater.jpg",
    "assets/jpg/faculty of science.jpg",
    "assets/jpg/tetfund.jpg",
    "assets/jpg/faculty of management science.jpg",
    "assets/jpg/shuttle stand.jpg",
    "assets/jpg/faculty of agric.jpg",
    "assets/jpg/faculty of engineering.jpg",
    "assets/jpg/zenith ict centre.jpg",
    "assets/jpg/social science theater.jpg",
    "assets/jpg/faculty of art.jpg",
    "assets/jpg/first bank.jpg",
    "assets/jpg/faculty of law.jpg",
    "assets/jpg/art theater.jpg",
    "assets/jpg/college of health.jpg",
    "assets/jpg/physics complex.jpg",
    "assets/jpg/faculty of vet medicine.jpg",
    "assets/jpg/chemistry lab.jpg",
    "assets/jpg/fayrouz joint.jpg",
    "assets/jpg/old girls hostel.jpg",
    "assets/jpg/middle girls hostel.jpg",
    "assets/jpg/new girls hostel.jpg",
    "assets/jpg/old boys hostel.jpg",
    "assets/jpg/new boys hostel.jpg",
    "assets/jpg/clinic.jpg",
    "assets/jpg/security unit.jpg",
    "assets/jpg/printing press.jpg",
    "assets/jpg/school gate.jpg",
  ];

  List locations = [
    "Senate Building",
    "Convocation Ground",
    "ETF",
    "Management Science Theater",
    "Adelabu Market",
    "Library",
    "Science Theater",
    "Faculty Of Science",
    "Tetfund",
    "Faculty Of Management Science",
    "Shuttle Stand",
    "Faculty Of Agric",
    "Faculty Of Engineering",
    "Zenith ICT Centre",
    "Social Science Theater",
    "Faculty Of Art",
    "First Bank",
    "Faculty Of Law",
    "Art Theater",
    "College of Health Science",
    "Physics Complex",
    "Faculty Of Vet Medicine",
    "Chemistry Lab",
    "Fayrouz Joint",
    "Old Girls Hostel",
    "Mid Girls Hostel",
    "New Girls Hostel",
    "Old Boys Hostel",
    "New Boys Hostel",
    "Clinic",
    "Security Unit",
    "Printing Press",
    "School Gate",
  ];

  List tempLocations = [
    "Senate Building",
    "Convocation Ground",
    "ETF",
    "Management Science Theater",
    "Adelabu Market",
    "Library",
    "Science Theater",
    "Faculty Of Science",
    "Tetfund",
    "Faculty Of Management Science",
    "Shuttle Stand",
    "Faculty Of Agric",
    "Faculty Of Engineering",
    "Zenith ICT Centre",
    "Social Science Theater",
    "Faculty Of Art",
    "First Bank",
    "Faculty Of Law",
    "Art Theater",
    "College of Health Science",
    "Physics Complex",
    "Faculty Of Vet Medicine",
    "Chemistry Lab",
    "Fayrouz Joint",
    "Old Girls Hostel",
    "Mid Girls Hostel",
    "New Girls Hostel",
    "Old Boys Hostel",
    "New Boys Hostel",
    "Clinic",
    "Security Unit",
    "Printing Press",
    "School Gate",
  ];

  List isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  void refresh(int index) {
    for (int i = 0; i < 33; i++) {
      if (i == index) {
        continue;
      } else {
        isSelected[i] = false;
      }
    }
    isSelected[index] = true;

    Marker selectedMarker = senateBuilding;
    switch (locations[index]) {
      case "Senate Building":
        selectedMarker = senateBuilding;
        break;
      case "Convocation Ground":
        selectedMarker = convGround;
        break;
      case "ETF":
        selectedMarker = etf;
        break;
      case "Management Science Theater":
        selectedMarker = mngScienceTheater;
        break;
      case "Adelabu Market":
        selectedMarker = adelabuMarket;
        break;
      case "Library":
        selectedMarker = library;
        break;
      case "Science Theater":
        selectedMarker = scienceTheater;
        break;
      case "Faculty Of Science":
        selectedMarker = facultyOfScience;
        break;
      case "Tetfund":
        selectedMarker = tetfund;
        break;
      case "Faculty Of Management Science":
        selectedMarker = facultyOfMngScience;
        break;
      case "Shuttle Stand":
        selectedMarker = shuttleStand;
        break;
      case "Faculty Of Agric":
        selectedMarker = facultyOfAgric;
        break;
      case "Faculty Of Engineering":
        selectedMarker = facultyOfEngineering;
        break;
      case "Zenith ICT Centre":
        selectedMarker = zenithBank;
        break;
      case "Social Science Theater":
        selectedMarker = facultyOfSocScience;
        break;
      case "Faculty Of Art":
        selectedMarker = facultyOfArt;
        break;
      case "First Bank":
        selectedMarker = firstBank;
        break;
      case "Faculty Of Law":
        selectedMarker = facultyOfLaw;
        break;
      case "Art Theater":
        selectedMarker = artTheater;
        break;
      case "College of Health Science":
        selectedMarker = facultyOfMedicine;
        break;
      case "Physics Complex":
        selectedMarker = physicsComplex;
        break;
      case "Faculty Of Vet Medicine":
        selectedMarker = facultyOfVetMedicine;
        break;
      case "Chemistry Lab":
        selectedMarker = chemistryLab;
        break;
      case "Fayrouz Joint":
        selectedMarker = fayrouzJoint;
        break;
      case "Old Girls Hostel":
        selectedMarker = oldGirlsHostel;
        break;
      case "Mid Girls Hostel":
        selectedMarker = midGirlsHostel;
        break;
      case "New Girls Hostel":
        selectedMarker = newGirlsHostel;
        break;
      case "Old Boys Hostel":
        selectedMarker = oldBoysHostel;
        break;
      case "New Boys Hostel":
        selectedMarker = newBoysHostel;
        break;
      case "Clinic":
        selectedMarker = clinic;
        break;
      case "Security Unit":
        selectedMarker = securityUnit;
        break;
      case "Printing Press":
        selectedMarker = printingPress;
        break;
      case "School Gate":
        selectedMarker = schoolGate;
        break;
      default:
        selectedMarker = senateBuilding;
    }

    googleMapController!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: selectedMarker.position,
          bearing: 30,
          zoom: 17,
        ),
      ),
    );
    googleMapController!.showMarkerInfoWindow(selectedMarker.markerId);
    notifyListeners();
  }

  void search(String value) {
    final loc = locations.where((location) {
      final locLower = location.toLowerCase();
      final valueLower = value.toLowerCase();

      return locLower.contains(valueLower);
    }).toList();
    locations = loc;
    if (value == "") {
      locations = tempLocations;
      for (int i = 0; i < 33; i++) {
        isSelected[i] = false;
      }
    }
    notifyListeners();
  }

  Marker facultyOfScience = Marker(
    markerId: const MarkerId("FacultyOfScience"),
    infoWindow: const InfoWindow(title: "Faculty of Science"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: const LatLng(8.981326, 7.178281),
  );
  Marker facultyOfAgric = Marker(
    markerId: const MarkerId("FacultyOfAgric"),
    infoWindow: const InfoWindow(title: "Faculty of Agriculture"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: const LatLng(8.982741, 7.176773),
  );
  Marker facultyOfEngineering = Marker(
    markerId: const MarkerId("FacultyOfEngineering"),
    infoWindow: const InfoWindow(title: "Faculty of Engineering"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: const LatLng(8.977627, 7.175916),
  );
  Marker facultyOfVetMedicine = Marker(
    markerId: const MarkerId("FacultyOfVetMedicine"),
    infoWindow: const InfoWindow(title: "Faculty of VetMedicine"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: const LatLng(8.979906, 7.174955),
  );
  Marker facultyOfMedicine = Marker(
    markerId: const MarkerId("FacultyOfMedicine"),
    infoWindow: const InfoWindow(title: "College of Health Science"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: const LatLng(8.978634, 7.173143),
  );
  Marker facultyOfMngScience = Marker(
    markerId: const MarkerId("FacultyOfMngScience"),
    infoWindow: const InfoWindow(title: "Faculty of Management Science"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: const LatLng(8.979305, 7.182855),
  );
  Marker facultyOfSocScience = Marker(
    markerId: const MarkerId("FacultyOfSocScience"),
    infoWindow: const InfoWindow(title: "Social Science Theater"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: const LatLng(8.978083, 7.184543),
  );
  Marker facultyOfLaw = Marker(
    markerId: const MarkerId("FacultyOfLaw"),
    infoWindow: const InfoWindow(title: "Faculty of Law"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: const LatLng(8.976319, 7.181377),
  );
  Marker facultyOfArt = Marker(
    markerId: const MarkerId("FacultyOfArt"),
    infoWindow: const InfoWindow(title: "Faculty of Art"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: const LatLng(8.974342, 7.182160),
  );

  Marker etf = Marker(
    markerId: const MarkerId("ETF"),
    infoWindow: const InfoWindow(title: "ETF"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    position: const LatLng(8.977045, 7.178410),
  );
  Marker tetfund = Marker(
    markerId: const MarkerId("Tetfund"),
    infoWindow: const InfoWindow(title: "Tetfund"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    position: const LatLng(8.976933, 7.177782),
  );
  Marker scienceTheater = Marker(
    markerId: const MarkerId("ScienceTheater"),
    infoWindow: const InfoWindow(title: "Science Theater"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    position: const LatLng(8.980743, 7.177610),
  );
  Marker physicsComplex = Marker(
    markerId: const MarkerId("PhysicsComplex"),
    infoWindow: const InfoWindow(title: "Physics Complex"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    position: const LatLng(8.980208, 7.177299),
  );
  Marker chemistryLab = Marker(
    markerId: const MarkerId("ChemistryLab"),
    infoWindow: const InfoWindow(title: "Chemistry Lab"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    position: const LatLng(8.984534, 7.177931),
  );
  Marker mngScienceTheater = Marker(
    markerId: const MarkerId("MngScienceTheater"),
    infoWindow: const InfoWindow(title: "Management Science Theater"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    position: const LatLng(8.979482, 7.182108),
  );
  Marker artTheater = Marker(
    markerId: const MarkerId("ArtTheater"),
    infoWindow: const InfoWindow(title: "Art Theater"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    position: const LatLng(8.973553, 7.182058),
  );

  Marker fayrouzJoint = Marker(
    markerId: const MarkerId("FayrouzJoint"),
    infoWindow: const InfoWindow(title: "Fayrouz Joint"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    position: const LatLng(8.974519, 7.178603),
  );
  Marker oldGirlsHostel = Marker(
    markerId: const MarkerId("OldGirlsHostel"),
    infoWindow: const InfoWindow(title: "Old Girls Hostel"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    position: const LatLng(8.974893, 7.176530),
  );
  Marker midGirlsHostel = Marker(
    markerId: const MarkerId("MidGirlsHostel"),
    infoWindow: const InfoWindow(title: "Mid Girls Hostel"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    position: const LatLng(8.974406, 7.177866),
  );
  Marker newGirlsHostel = Marker(
    markerId: const MarkerId("NewGirlsHostel"),
    infoWindow: const InfoWindow(title: "New Girls Hostel"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    position: const LatLng(8.971915, 7.179130),
  );
  Marker oldBoysHostel = Marker(
    markerId: const MarkerId("OldBoysHostel"),
    infoWindow: const InfoWindow(title: "Old Boys Hostel"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    position: const LatLng(8.973330, 7.186607),
  );
  Marker newBoysHostel = Marker(
    markerId: const MarkerId("NewBoysHostel"),
    infoWindow: const InfoWindow(title: "New Boys Hostel"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    position: const LatLng(8.975990, 7.187823),
  );
  Marker adelabuMarket = Marker(
    markerId: const MarkerId("AdelabuMarket"),
    infoWindow: const InfoWindow(title: "Adelabu Market"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
    position: const LatLng(8.975768, 7.184772),
  );

  Marker senateBuilding = Marker(
    markerId: const MarkerId("SenateBuilding"),
    infoWindow: const InfoWindow(title: "Senate Building"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(8.981527, 7.179846),
  );
  Marker convGround = Marker(
    markerId: const MarkerId("ConvGround"),
    infoWindow: const InfoWindow(title: "Convocation Ground"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(8.980154, 7.180185),
  );
  Marker shuttleStand = Marker(
    markerId: const MarkerId("ShuttleStand"),
    infoWindow: const InfoWindow(title: "Shuttle Stand"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(8.979426, 7.180820),
  );
  Marker zenithBank = Marker(
    markerId: const MarkerId("ZenithBank"),
    infoWindow: const InfoWindow(title: "Zenith ICT Centre"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(8.978539, 7.178837),
  );
  Marker firstBank = Marker(
    markerId: const MarkerId("FirstBank"),
    infoWindow: const InfoWindow(title: "First Bank"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(8.978073, 7.177301),
  );
  Marker clinic = Marker(
    markerId: const MarkerId("Clinic"),
    infoWindow: const InfoWindow(title: "Clinic"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(8.979424, 7.172085),
  );
  Marker securityUnit = Marker(
    markerId: const MarkerId("SecurityUnit"),
    infoWindow: const InfoWindow(title: "Security Unit"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(8.974594, 7.177610),
  );
  Marker library = Marker(
    markerId: const MarkerId("Library"),
    infoWindow: const InfoWindow(title: "Library"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(8.979244, 7.179670),
  );
  Marker printingPress = Marker(
    markerId: const MarkerId("PrintingPress"),
    infoWindow: const InfoWindow(title: "Printing Press"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(8.983578, 7.178283),
  );
  Marker schoolGate = Marker(
    markerId: const MarkerId("SchoolGate"),
    infoWindow: const InfoWindow(title: "School Gate"),
    alpha: 0.85,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    position: const LatLng(8.987002, 7.185979),
  );
}
