import 'package:flutter/material.dart';
import 'package:shop714/const/const.dart';

class DescriptionText extends StatelessWidget {
  String title;
  String description;
  DescriptionText({
    this.title = 'Title',
    this.description = 'this is a sample Description',
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kLargeBoldTextStyle,
          ),
          SizedBox(
            height: 5,
          ),
          Text(description),
        ],
      ),
    );
  }
}
