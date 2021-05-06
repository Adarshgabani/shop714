import 'package:flutter/material.dart';
import 'package:shop714/Screens/Auth/wrapper.dart';
import 'package:shop714/Screens/CartScreen/cart_screen.dart';
import 'package:shop714/Screens/Categories/Categories.dart';
import 'package:shop714/Screens/Category/category_screen.dart';
import 'package:shop714/Screens/OrdersScreen/orders_screen.dart';
import 'package:shop714/Screens/HomeScreen/home_screen.dart';
import 'package:shop714/Screens/LoginScreen/login_screen.dart';
import 'package:shop714/Screens/ProductDetail/product_detail_screen.dart';
import 'package:shop714/Screens/RegisterScreen/register_screen.dart';
import 'package:shop714/Screens/YourOrderScreen/your_order_screen.dart';

final Map<String, WidgetBuilder> routes = {
  Wrapper.routeName: (context) => Wrapper(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CategoriesScreen.routeName: (context) => CategoriesScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  OrdersScreen.routeName: (context) => OrdersScreen(),
  YourOrderScreen.routeName: (context) => YourOrderScreen(),
};
