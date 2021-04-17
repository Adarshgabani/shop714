import 'package:flutter/material.dart';
import 'package:shop714/Screens/Auth/firebase_api.dart';
import 'package:shop714/Screens/CartScreen/cart_screen.dart';
import 'package:shop714/const/const.dart';

AppBar AppBarWidget(BuildContext context) {
  FirebaseAPIServices _apiServices = FirebaseAPIServices();
  return AppBar(
    titleSpacing: 30,
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pushNamed(context, CartScreen.routeName);
        },
      ),
      IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        padding: EdgeInsets.all(0),
        iconSize: 28,
        onPressed: () {
          print('object');
          _apiServices.signOut().then((value) => print(value));
          Navigator.pushReplacementNamed(context, '/');
        },
      ),
      Container(
        width: 22,
      )
    ],
    title: Hero(
      tag: 'logo',
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        height: kHeight50,
        // color: Colors.black,
        child: Text(
          "App Logo",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        // child: Image.asset(
        //   'assets/images/Logo.png',
        // ),
      ),
    ),
  );
}

AppBar AppBarWithCartWidget({BuildContext context, String title}) {
  // FirebaseAPIServices _apiServices = FirebaseAPIServices();
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pushNamed(context, CartScreen.routeName);
        },
      ),
      IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        padding: EdgeInsets.all(0),
        iconSize: 28,
        onPressed: () {},
      ),
      Container(
        width: 22,
      )
    ],
    leadingWidth: 80,
    leading: Container(
      child: TextButton(
        child: SizedBox(
          width: 20,
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    centerTitle: true,
    titleSpacing: 10,
    title: Text(
      title,
      style: TextStyle(color: Colors.black, fontSize: 18),
    ),
  );
}
