import 'package:flutter/material.dart';
import 'package:shop714/Screens/Auth/wrapper.dart';
import 'package:shop714/Screens/CartScreen/cart_screen.dart';
import 'package:shop714/Screens/Categories/Categories.dart';
import 'package:shop714/Screens/Category/category_screen.dart';
import 'package:shop714/Screens/ChangePasswordScreen/change_password_screen.dart';
import 'package:shop714/Screens/HomeScreen/home_screen.dart';
import 'package:shop714/Screens/LoginScreen/login_screen.dart';
import 'package:shop714/Screens/ProductDetail/product_detail_screen.dart';
import 'package:shop714/Screens/RegisterScreen/register_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Wrapper.routeName: (context) => Wrapper(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CategoriesScreen.routeName: (context) => CategoriesScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
};
