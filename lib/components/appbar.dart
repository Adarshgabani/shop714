import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop714/Screens/Auth/firebase_api.dart';
import 'package:shop714/Screens/Auth/wrapper.dart';
import 'package:shop714/Screens/CartScreen/cart_screen.dart';
import 'package:shop714/Screens/OrdersScreen/orders_screen.dart';
import 'package:shop714/const/const.dart';

Widget createDrawerBodyItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}

Widget DrawerWidget({BuildContext context, String email = "Guest"}) {
  FirebaseAPIServices _apiServices = FirebaseAPIServices();
  _signout() {
    _apiServices.signOut();
    Navigator.pushReplacementNamed(context, Wrapper.routeName);
  }

  return Container(
    width: MediaQuery.of(context).size.width * 0.7,
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: kGreyBGColor),
            accountName: Text(
              email ?? 'Email',
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: kGreyBorderColor,
              child: Text(
                email == null ? 'E' : email[0].toUpperCase(),
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
          ),
          createDrawerBodyItem(
              icon: Icons.shopping_bag,
              text: "Your Orders",
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, OrdersScreen.routeName);
              }),
          createDrawerBodyItem(
              icon: Icons.shopping_cart,
              text: "Cart Items",
              onTap: () => Navigator.pushNamed(context, CartScreen.routeName)),
          createDrawerBodyItem(
              icon: Icons.logout, text: "Logout", onTap: () => _signout()),
        ],
      ),
    ),
  );
}

AppBar AppBarWidget(BuildContext context) {
  // FirebaseAPIServices _apiServices = FirebaseAPIServices();
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
      // InkWell(
      //   splashColor: Colors.transparent,
      //   highlightColor: Colors.transparent,
      //   onTap: () {
      //     print('object');
      //     _apiServices.signOut().then((value) => print(value));
      //     Navigator.pushReplacementNamed(context, '/');
      //   },
      //   child: Container(
      //     width: 30,
      //     margin: EdgeInsets.all(5),
      //     child: Icon(
      //       Icons.menu,
      //       color: Colors.black,
      //       size: 24,
      //     ),
      //   ),
      // ),
      Container(
        width: 30,
      )
    ],
    title: Hero(
      tag: 'first',
      child: Container(
        // color: Colors.green,
        padding: EdgeInsets.symmetric(vertical: 0),
        // child: Text(
        //   "SHOP714",
        //   style: TextStyle(
        //     fontSize: 22,
        //     color: Colors.black,
        //     fontFamily: "Roboto",
        //   ),
        // ),
        child: Image.asset(
          'assets/images/logo.png',
          // fit: BoxFit.fitHeight,
          width: 100,
          // height: 50,
        ),
      ),
    ),
  );
}

AppBar AppBarWithCartWidget({BuildContext context, String title}) {
  // FirebaseAPIServices _apiServices = FirebaseAPIServices();
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leadingWidth: 80,
    automaticallyImplyLeading: false,
    centerTitle: true,
    titleSpacing: 10,
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
      // InkWell(
      //   splashColor: Colors.transparent,
      //   highlightColor: Colors.transparent,
      //   onTap: () {
      //     print('object');
      //     _apiServices.signOut().then((value) => print(value));
      //     Navigator.pushReplacementNamed(context, '/');
      //   },
      //   child: Container(
      //     width: 30,
      //     margin: EdgeInsets.all(5),
      //     child: Icon(
      //       Icons.menu,
      //       color: Colors.black,
      //       size: 24,
      //     ),
      //   ),
      // ),
      Container(
        width: 30,
      )
    ],
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
    title: Text(
      title,
      style: TextStyle(color: Colors.black, fontSize: 18),
    ),
  );
}

AppBar CartScreenAppBarWidget({BuildContext context}) {
  // FirebaseAPIServices _apiServices = FirebaseAPIServices();
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    actions: [
      // InkWell(
      //   splashColor: Colors.transparent,
      //   highlightColor: Colors.transparent,
      //   onTap: () {
      //     print('object');
      //     _apiServices.signOut().then((value) => print(value));
      //     Navigator.pushReplacementNamed(context, '/');
      //   },
      //   child: Container(
      //     width: 30,
      //     margin: EdgeInsets.all(5),
      //     child: Icon(
      //       Icons.menu,
      //       color: Colors.black,
      //       size: 24,
      //     ),
      //   ),
      // ),
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
      'Your Cart',
      style: TextStyle(color: Colors.black, fontSize: 18),
    ),
  );
}
