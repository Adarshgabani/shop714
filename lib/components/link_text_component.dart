import 'package:flutter/material.dart';
import 'package:shop714/const/const.dart';

class LinkText extends StatelessWidget {
  final String link;
  final String textMessage;
  final Function onTap;
  LinkText(
      {@required this.link, @required this.textMessage, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textMessage,
            style: kRegularTextStyle.copyWith(color: Colors.black),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.black,
                width: 1.0, // Underline thickness
              ))),
              child: Text(
                link,
                style: kRegularTextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
