import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ignite_driver2/screens/mainPage.dart';
import 'package:ignite_driver2/widgets/globalVariables.dart';
import 'package:ignite_driver2/widgets/taxiButton.dart';

class VehicleInfoPage extends StatefulWidget {
  static const String id = 'vehicleinfo';

  @override
  _VehicleInfoPageState createState() => _VehicleInfoPageState();
}

class _VehicleInfoPageState extends State<VehicleInfoPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void showSnackBar(String title) {
    final snackbar = SnackBar(
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  var carYearController = TextEditingController();

  var carMakeController = TextEditingController();

  var carModelController = TextEditingController();

  var carColorController = TextEditingController();

  void updateProfile(context) {
    String id = currentFirebaseUser.uid;

    DatabaseReference driverRef = FirebaseDatabase.instance
        .reference()
        .child('drivers/$id/vehicle_details');

    Map map = {
      'car_year': carYearController.text,
      'car_make': carMakeController.text,
      'car_model': carModelController.text,
      'car_color': carColorController.text,
    };

    driverRef.set(map);

    Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 70),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'images/ignite.png',
                      width: 110.0,
                      height: 110.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              )),
          Column(
            children: <Widget>[
              SizedBox(height: 10),
              Text(
                'Enter Vehicle Details',
                style: TextStyle(
                  fontFamily: 'Brand-Bold',
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 25),
              TextField(
                controller: carYearController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Car Year',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: carMakeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Car Make',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: carModelController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Car Model',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: carColorController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Car Color',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 40,
              ),
              TaxiButton(
                color: Colors.green[700],
                title: 'CONTINUE',
                onPressed: () {
                  if (carYearController.text.length < 4) {
                    showSnackBar('Please provide a valid car year');
                    return;
                  }
                  if (carMakeController.text.length < 3) {
                    showSnackBar('Please provide a valid car make');
                    return;
                  }
                  if (carColorController.text.length < 3) {
                    showSnackBar('Please provide a valid car color');
                    return;
                  }

                  updateProfile(context);
                },
              )
            ],
          )
        ]))));
  }
}
