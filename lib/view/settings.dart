import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal/view/settings_widgets/settings_list.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                "Settings",
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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SettingsList(),
            Container(
              width: size.width,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade50,
              ),
              child: Text(
                "NOTE: When Fingerprint Login is enabled, it logins the current profile which it was enabled on.",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.green.shade800,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
