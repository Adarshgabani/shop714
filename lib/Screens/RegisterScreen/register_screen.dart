import 'package:flutter/material.dart';
import 'package:shop714/Screens/Auth/firebase_api.dart';
import 'package:shop714/Screens/HomeScreen/home_screen.dart';
import 'package:shop714/components/button_component.dart';
import 'package:shop714/components/link_text_component.dart';
import 'package:shop714/components/text_field_component.dart';
import 'package:shop714/const/const.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController,
      _passwordController,
      _conPasswordController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseAPIServices _apiServices = FirebaseAPIServices();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _conPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _conPasswordController.dispose();
  }

  //
  // _submitForm(context, email, password) {
  //   _scaffoldKey.currentState
  //     ..removeCurrentSnackBar()
  //     ..showSnackBar(
  //       SnackBar(
  //         // backgroundColor: Colors.red,
  //         content: Text('$email , $password'),
  //         duration: Duration(milliseconds: 4000),
  //       ),
  //     );
  // }
  //
  _errorMessage(context, message) {
    _scaffoldKey.currentState
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message),
          duration: Duration(milliseconds: 2000),
        ),
      );
  }

  //if return null than success
//else return error string
  String _validateForm(email, password, conPassword) {
    if (email.isEmpty) {
      return 'Please Enter Email ';
    } else if (password.isEmpty) {
      return 'Please Enter Password';
    } else if (conPassword.isEmpty) {
      return 'Please Enter Confirm Password';
    } else {
      String _passwordError = _passwordValidator(password);
      String _emailError = _emailValidator(email);
      if (_emailError == null) {
        if (password.length < 8) {
          return 'Password should be more than 12 characters';
        } else {
          if (password == conPassword) {
            if (_passwordError == null) {
              return null; //success (valid )
            } else {
              return _passwordError;
            }
          } else {
            return "Password and Confirm Password should be same";
          }
        }
      } else {
        return _emailError;
      }
    }
  }

//TODO: validate email while register ::
  String _emailValidator(value) {
    bool emailValid = RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])")
        .hasMatch(value);

    if (value.isEmpty) {
      return "Please enter Email Id";
    }
    if (emailValid) {
      return null;
    } else {
      return 'Please Enter Valid Email';
    }
  }

  String _passwordValidator(value) {
    Pattern _passwordPattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(_passwordPattern);
    if (!regExp.hasMatch(value)) {
      return 'Enter valid password (use Uppercase, Number, Symbol)';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      body: SafeArea(
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
                        width: kWidth250,
                        margin: EdgeInsets.only(
                          bottom: kHeight30,
                        ),
                        child: Image.asset(
                          'assets/images/logo.PNG',
                          width: kWidth250,
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
                    TextFieldComponent(
                      controller: _conPasswordController,
                      lable: 'Confirm Password',
                      obSecureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      password: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ButtonComponent(
                      label: 'Register',
                      onPressed: () {
                        String _validation = _validateForm(
                            _emailController.text,
                            _passwordController.text,
                            _conPasswordController.text);
                        //
                        if (_validation == null) {
                          FocusScope.of(context).unfocus(); //to hide keyboard
                          // _submitForm(context, model.email, model.password);
                          print('Validate');
                          _apiServices
                              .createUserWithEmail(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((res) {
                            if (res == "success") {
                              print("User crated Successfully");

                              _emailController.clear();
                              _passwordController.clear();
                              _conPasswordController.clear();
                              Navigator.pushReplacementNamed(
                                  context, HomeScreen.routeName);
                            } else {
                              print("Error : " + res);
                              _errorMessage(context, res);
                            }
                          });
                        } else {
                          print(_validation);
                          _errorMessage(context, _validation);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            LinkText(
                textMessage: 'Already a member ? ',
                link: 'Sign In',
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
