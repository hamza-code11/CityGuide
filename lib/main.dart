import 'package:cityguid/firebase_options.dart';
import 'package:cityguid/views/CategoriesScreen.dart';
import 'package:cityguid/views/CategoryDetails.dart';
import 'package:cityguid/views/ContactScreen.dart';
import 'package:cityguid/views/HelpSupportPage.dart';
import 'package:cityguid/views/HospitalScreen%20copy%203.dart';
import 'package:cityguid/views/IndexScreen.dart';
import 'package:cityguid/views/LoginScreen.dart';
import 'package:cityguid/views/ParkScreen.dart';
import 'package:cityguid/views/PreferencesPage.dart';
import 'package:cityguid/views/PrivacyPage.dart';
import 'package:cityguid/views/ProfilePage.dart';
import 'package:cityguid/views/StartScreen.dart';
import 'package:cityguid/views/settingScreen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            titleLarge: TextStyle(
                color: Colors.white, fontFamily: "inter", fontSize: 48),
            titleMedium: TextStyle(
                color: Colors.white,
                fontFamily: "inter",
                fontSize: 35,
                fontWeight: FontWeight.w600),
            titleSmall: TextStyle(
                color: Colors.white, fontFamily: "inter", fontSize: 15)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Startscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
