import 'package:flutter/material.dart';
import 'package:shop714/const/const.dart';

class MainScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height: kHeight250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.fill,
              image: ExactAssetImage('assets/images/main.jpg'))),
      // child: Image.asset('assets/images/main.jpg'),
    );
  }
}
