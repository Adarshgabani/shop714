import 'package:flutter/material.dart';
import 'package:shop714/const/const.dart';

class CartButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  double buttonHeight;
  double fontSize;
  double buttonWidht;
  double borderRadius;
  CartButton({
    this.label,
    this.onPressed,
    this.buttonHeight = 30,
    this.buttonWidht,
    this.borderRadius = 10.0,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidht,
      height: buttonHeight,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        color: kBlueColor,
        child: Text(
          label,
          style:
              kSmallTextStyle.copyWith(color: Colors.white, fontSize: fontSize),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
