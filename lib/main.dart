import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ignite_driver2/screens/registrationPage.dart';
import 'package:ignite_driver2/screens/vehicleInfo.dart';
import './screens/mainPage.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: Platform.isIOS
        ? FirebaseOptions(
            appId: '1:724868990884:ios:5abeb1911c2101cd252331',
            apiKey: 'AIzaSyCb9rqZLuWx8TPwONErL7fSiXe7qII0jhA',
            projectId: 'ignite3420',
            messagingSenderId: '724868990884',
            databaseURL: 'https://ignite3420-default-rtdb.firebaseio.com',
          )
        : FirebaseOptions(
            appId: '1:724868990884:android:45d926ea84650d5c252331',
            apiKey: 'AIzaSyCb9rqZLuWx8TPwONErL7fSiXe7qII0jhA',
            messagingSenderId: '724868990884',
            projectId: 'ignite3420',
            databaseURL: 'https://ignite3420-default-rtdb.firebaseio.com',
          ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Ignite Dryvz',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: RegistrationPage.id,
        routes: {
          MainPage.id: (context) => MainPage(),
          RegistrationPage.id: (context) => RegistrationPage(),
          VehicleInfoPage.id: (context) => VehicleInfoPage(),
        });
  }
}
