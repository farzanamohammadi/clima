import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../services/location.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  LocationPermission? permission;
  @override
  void initState() {

    super.initState();
    getPermission();
  }
  void getPermission() async {
    permission = await geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      print('Permission denied');
      permission = await geolocatorPlatform.requestPermission();
      if (permission != LocationPermission.denied) {
        if (permission == LocationPermission.deniedForever) {
          print(
              'Permission denied permanently, please provide permission to the app from device setting.');
        } else {
          print('Permission granted');
          getLocation();
        }
      } else {
        print('User denied the request');
      }
    } else {
      getLocation();
    }
  }

  void getLocation() async {
   Location location = Location();
    await location.getCurrentLocation();
   print(location.latitude);
   print(location.longitude);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(

        ),
      ),
    );
  }
}
