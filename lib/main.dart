import 'package:cityguid/firebase_options.dart';

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
      home: Loginscreen(),

    );
  }
}
