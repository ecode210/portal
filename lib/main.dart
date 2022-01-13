import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portal/view/home.dart';
import 'package:portal/viewmodel/login.dart';
import 'package:portal/viewmodel/map.dart';
import 'package:portal/viewmodel/user_information.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Hive.openBox('portal');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Login(),
        ),
        ChangeNotifierProvider.value(
          value: UserInformation(),
        ),
        ChangeNotifierProvider.value(
          value: SchoolMap(),
        ),
      ],
      builder: (context, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Student Portal Mobile Application",
          theme: ThemeData(
              pageTransitionsTheme: PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  }
              )
          ),
          home: Home(),
        );
      },
    );
  }
}
