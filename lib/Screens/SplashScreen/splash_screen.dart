import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shop714/Screens/Auth/wrapper.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),()=>Navigator.pushReplacementNamed(context, Wrapper.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Text("SplashScreen"),
      ),
    );
  }
}
