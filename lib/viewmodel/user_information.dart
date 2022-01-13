import 'package:flutter/cupertino.dart';

class UserInformation extends ChangeNotifier{

  var user;
  int userIndex = 0;

  String fullName = "OYEDELE, Emmanuel Olawole";
  int matricNumber = 17283020;
  String faculty = "Science";
  String department = "Computer Science";
  String programme = "B.Sc. Computer Science";
  int currentLevel = 400;

  String currentSession = "2020/2021";
  int schoolCharges = 39500;

  String email = "oyedele.emmanuel2017@uniabuja.edu.ng";
  String phoneNumber = "08138313912";

  int paymentPrice = 5000;

  String siwesAttachmentPeriodFrom = "";
  void setAttachmentPeriodFrom(var date){
    siwesAttachmentPeriodFrom = date.toString().substring(0, 10);
    notifyListeners();
  }

  String siwesAttachmentPeriodTo = "";
  void setAttachmentPeriodTo(var date){
    siwesAttachmentPeriodTo = date.toString().substring(0, 10);
    notifyListeners();
  }

  String? siwesYear;
  String get currentSiwesYear{
    notifyListeners();
    return siwesYear!;
  }

}