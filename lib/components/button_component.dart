import 'package:flutter/material.dart';
import 'package:shop714/const/const.dart';

class ButtonComponent extends StatelessWidget {
  final String label;
  final Function onPressed;
  ButtonComponent({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kWidthInfinity,
      height: 55,
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: kBlueColor,
        child: Text(
          label,
          style: kMediumTextStyle,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
