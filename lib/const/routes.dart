import 'package:flutter/material.dart';
import 'package:shop714/Screens/Auth/wrapper.dart';
import 'package:shop714/Screens/HomeScreen/home_screen.dart';
import 'package:shop714/Screens/LoginScreen/login_screen.dart';
import 'package:shop714/Screens/RegisterScreen/register_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Wrapper.routeName: (context) => Wrapper(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};
