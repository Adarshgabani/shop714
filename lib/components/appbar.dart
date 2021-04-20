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
      InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Icon(
          Icons.shopping_cart,
          color: Colors.black,
          size: 22,
        ),
        onTap: () {
          Navigator.pushNamed(context, CartScreen.routeName);
        },
      ),
      InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          print('object');
          // _apiServices.signOut().then((value) => print(value));
          // Navigator.pushReplacementNamed(context, '/');
        },
        child: Container(
          width: 30,
          margin: EdgeInsets.all(5),
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          ),
        ),
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
      InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Icon(
          Icons.shopping_cart,
          color: Colors.black,
          size: 22,
        ),
        onTap: () {
          Navigator.pushNamed(context, CartScreen.routeName);
        },
      ),
      InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          print('object');
          // _apiServices.signOut().then((value) => print(value));
          // Navigator.pushReplacementNamed(context, '/');
        },
        child: Container(
          width: 30,
          margin: EdgeInsets.all(5),
          child: Icon(
            Icons.menu,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      Container(
        width: 22,
      )
    ],
    leadingWidth: 80,
    leading: Hero(
      tag: "back",
      child: Container(
        child: TextButton(
          child: SizedBox(
            width: 20,
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.black,
              size: 22,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
