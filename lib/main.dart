import 'package:flutter/material.dart';
import 'package:shop714/Screens/Auth/wrapper.dart';
import 'package:shop714/Screens/LoginScreen/login_screen.dart';
import 'package:shop714/const/routes.dart';
import 'package:shop714/size_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: Wrapper.routeName,
      // home: LoginScreen(),
    );
  }
}
