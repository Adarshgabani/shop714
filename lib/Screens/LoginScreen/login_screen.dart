import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop714/Screens/Auth/firebase_api.dart';
import 'package:shop714/Screens/HomeScreen/home_screen.dart';
import 'package:shop714/Screens/RegisterScreen/register_screen.dart';
import 'package:shop714/components/button_component.dart';
import 'package:shop714/components/link_text_component.dart';
import 'package:shop714/components/text_field_component.dart';
import 'package:shop714/const/const.dart';
import 'package:shop714/size_config.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController, _passwordController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseAPIServices _apiServices = FirebaseAPIServices();
  // String _email, _password;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  _errorMessage(context, message) {
    _scaffoldKey.currentState
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message),
          duration: Duration(milliseconds: 2000),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) =>
              NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overScroll) {
              overScroll.disallowGlow();
              return;
            },
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                    ),
                    Form(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: kWidth40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Hero(
                              tag: 'first',
                              child: Container(
                                height: 80,
                                margin: EdgeInsets.only(
                                  bottom: kHeight30,
                                ),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                            kBlueColor, BlendMode.overlay),
                                        child: Image.asset(
                                          'assets/images/a.png',
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      child: Container(
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        width: 300,
                                        height: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 12),
                                            child: Text(
                                              "714",
                                              style: TextStyle(
                                                  fontFamily: 'Playfair',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ))),
                                  ],
                                ),
                              ),
                            ),
                            TextFieldComponent(
                              controller: _emailController,
                              lable: 'Email',
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFieldComponent(
                              controller: _passwordController,
                              lable: 'Password',
                              obSecureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              password: true,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ButtonComponent(
                              label: 'LOGIN',
                              onPressed: () {
                                // _email = _emailController.text;
                                // _password = _passwordController.text;
                                String _validation = _validateForm(
                                    _emailController.text,
                                    _passwordController.text);
                                if (_validation == null) {
                                  FocusScope.of(context)
                                      .unfocus(); //to hide keyboard
                                  _apiServices
                                      .signInWithEmail(
                                          email: _emailController.text,
                                          password: _passwordController.text)
                                      .then((res) {
                                    if (res == "success") {
                                      print("Success Fully loggedin");
                                      _emailController.clear();
                                      _passwordController.clear();
                                      Navigator.pushReplacementNamed(
                                          context, HomeScreen.routeName);
                                    } else {
                                      print(res);
                                      _errorMessage(context, res);
                                    }
                                  });
                                } else {
                                  _errorMessage(context, _validation);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    LinkText(
                      textMessage: 'Not a member ? ',
                      link: 'Signup now',
                      onTap: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//if return null than success
//else return error string
String _validateForm(email, password) {
  if (email.isEmpty) {
    return 'Please Enter Email ';
  } else if (password.isEmpty) {
    return 'Please Enter Password';
  } else {
    return null;
  }
}
//
// String _emailValidator(value) {
//   bool emailValid = RegExp(
//           r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])")
//       .hasMatch(value);
//   // print(value.isValidEmail());
//   if (value.isEmpty) {
//     return "Please enter Email Id";
//   }
//   if (emailValid) {
//     return 'Valid Email';
//   }
//   return null;
// }
//
// String _passwordValidator(value) {
//   if (value.isEmpty) {
//     return "Please enter Password";
//   }
//   return null;
// }
