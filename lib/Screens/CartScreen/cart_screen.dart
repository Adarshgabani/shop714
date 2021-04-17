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
          IconButton(
            icon: Icon(Icons.menu),
            padding: EdgeInsets.all(0),
            color: Colors.black54,
            iconSize: 30,
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
              child: Icon(Icons.arrow_back),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
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
