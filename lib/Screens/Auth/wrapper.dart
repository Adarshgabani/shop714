import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shop714/Screens/HomeScreen/home_screen.dart';
import 'package:shop714/Screens/LoginScreen/login_screen.dart';
import 'package:shop714/State/app_state.dart';
import 'package:shop714/const/const.dart';

class Wrapper extends StatelessWidget {
  static String routeName = '/';
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AppDataState>(context, listen: false);
    // return FutureBuilder(
    //   future: _initialization,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       FirebaseAuth.instance.authStateChanges().listen((User user) {
    //         if (user == null) {
    //           print("currently signed out!!");
    //           // return LoginScreen();
    //           return Scaffold(
    //             body: SafeArea(
    //               child: Text("SigninScreen"),
    //             ),
    //           );
    //           // Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    //         } else {
    //           print("User signed in");
    //           return Scaffold(
    //             body: SafeArea(
    //               child: Text("HomeScreen"),
    //             ),
    //           );
    //           // return HomeScreen();
    //
    //           // Navigator.pushNamedAndRemoveUntil(
    //           //     context, HomeScreen.routeName, (route) => false);
    //         }
    //       });
    //     }
    //     return Scaffold(
    //       body: Center(
    //         child: Text("SplashScreen"),
    //       ),
    //     );
    //   },
    // );
    _auth.authStateChanges().listen((User user) {
      if (user == null) {
        print("currently signed out!!");
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.routeName, (route) => false);
      } else {
        print("User signed in");
        _provider.setUserIdAndEmail(id: user.uid, email: user.email);
        _provider.getProductList();
        _provider.getCategoryList().then((value) {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        });
      }
    });

    return Scaffold(
      backgroundColor: Color(0xff002b5c),
      body: Center(
        child: Hero(
          tag: 'first',
          child: Container(
            height: 200,
            child: Image.asset('assets/images/splash.png'),
          ),
        ),
      ),
    );
  }
}
