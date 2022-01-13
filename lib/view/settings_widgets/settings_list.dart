import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:portal/viewmodel/login.dart';
import 'package:portal/viewmodel/user_information.dart';
import 'package:provider/provider.dart';

class SettingsList extends StatefulWidget {
  const SettingsList({Key? key}) : super(key: key);

  @override
  _SettingsListState createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 70,
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.fingerprint_rounded,
                color: Colors.green,
                size: 30,
              ),
            ),
          ),
          Flexible(
            flex: 7,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Fingerprint Login",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.green.shade700,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              alignment: Alignment.centerRight,
              child: Consumer<Login>(
                builder: (context, login, child){
                  return CupertinoSwitch(
                    onChanged: (bool newValue) {
                      setState(() {
                        Hive.box("portal").put("biometrics", newValue);
                        if(newValue){
                          Hive.box("portal").put("userIndex", Provider.of<UserInformation>(context, listen: false).userIndex);
                        }
                      });
                    },
                    value: Hive.box("portal").get("biometrics"),
                    activeColor: Colors.green.shade700,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
