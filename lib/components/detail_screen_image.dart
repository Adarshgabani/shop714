import 'package:flutter/material.dart';
import 'package:shop714/const/const.dart';

class DetailScreenImage extends StatelessWidget {
  String url;
  DetailScreenImage({@required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      height: kHeight300,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.contain, image: NetworkImage(url)),
      ),
      // child: Image.asset('assets/images/main.jpg'),
    );
  }
}
