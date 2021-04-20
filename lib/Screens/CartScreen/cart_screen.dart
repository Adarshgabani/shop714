import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static String routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
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
        title: Text(
          'Your Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(child: Text("CartScreen")),
    );
  }
}
