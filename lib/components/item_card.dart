import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
// import 'package:matemart/Screens/Category/category_screen.dart';
import 'package:shop714/const/const.dart';

class ItemCard extends StatelessWidget {
  String title;
  String imageUrl;
  String categoryId;
  Color bgColor;
  String routeName;
  Object routeArguments;
  ItemCard({
    this.title,
    this.imageUrl,
    this.categoryId,
    this.bgColor,
    @required this.routeArguments,
    @required this.routeName,
  });
  @override
  Widget build(BuildContext context) {
    return Container(

      width: kWidth165,
      decoration: BoxDecoration(
        color: bgColor ?? kGreyCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName, arguments: routeArguments);
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 15, right: 15, bottom: 30),
              child: Center(
                child: Hero(
                    tag: imageUrl,
                    child: Image(image: FirebaseImage(imageUrl))),
              ),
              // child: Center(child: Image.network(imageUrl)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Align(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kSmallTextStyle.copyWith(fontFamily: 'Playfair'),
                ),
                alignment: Alignment.bottomCenter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
