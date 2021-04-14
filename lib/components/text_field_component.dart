import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop714/const/const.dart';

class TextFieldComponent extends StatefulWidget {
  final String lable;
  bool password;
  bool obSecureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  TextFieldComponent({
    @required this.lable,
    this.obSecureText = false,
    @required this.keyboardType,
    @required this.controller,
    this.password = false,
  });

  @override
  _TextFieldComponentState createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 55,
          decoration: BoxDecoration(
            color: kGreyBGColor,
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 50),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            cursorColor: Colors.black,
            enableSuggestions: false,
            autocorrect: false,
            obscureText: widget.obSecureText,
            controller: widget.controller,
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
              border: InputBorder.none,
              // hintText: lable,
              labelText: widget.lable,
              labelStyle: kRegularTextStyle,
            ),
          ),
        ),
        widget.password
            ? (Positioned(
                right: 10,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.obSecureText = !widget.obSecureText;
                    });
                  },
                  child: Container(
                    child: Icon(
                      widget.obSecureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ))
            : Container(),
      ],
    );
  }
}
