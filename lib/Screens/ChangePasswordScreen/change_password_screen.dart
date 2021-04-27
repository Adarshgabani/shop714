import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop714/components/text_field_component.dart';

class ChangePasswordScreen extends StatelessWidget {
  static String routeName = '/changePassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [Text("Change Password Screen")],
        ),
      ),
    );
  }
}
