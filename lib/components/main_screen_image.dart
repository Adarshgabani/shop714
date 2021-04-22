import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop714/Models/ads_model.dart';
import 'package:shop714/const/const.dart';
import 'package:shop714/db/firebase_realtime_db.dart';

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

//

  // FirebaseDbApi _dbApi = FirebaseDbApi();
  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder<List<AdsModel>>(
  //     future: _dbApi.getAdsData(),
  //     builder: (context, snapshot) {
  //
  //       if (snapshot.connectionState == ConnectionState.done &&
  //           snapshot.hasData == null) {
  //         return Container(
  //           child: Text('waiting....'),
  //         );
  //       } else if (snapshot.hasData) {
  //
  //
  //         return AdsSliderImages(data: snapshot.data);
  //       } else {
  //         return Shimmer.fromColors(
  //           child: Container(
  //             decoration: BoxDecoration(
  //                 color: kGreyBGColor, borderRadius: BorderRadius.circular(10)),
  //             margin: EdgeInsets.only(right: 10),
  //             height: kHeight250,
  //           ),
  //           baseColor: kGreyBGColor,
  //           highlightColor: Colors.white,
  //         );
  //       }
  //     },
  //   );
  // }
}

class AdsSliderImages extends StatefulWidget {
  List<AdsModel> data;
  AdsSliderImages({this.data});
  @override
  _AdsSliderImagesState createState() => _AdsSliderImagesState();
}

class _AdsSliderImagesState extends State<AdsSliderImages> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: widget.data
              .map((e) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    height: kHeight250,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FirebaseImage(e.imageUrl),
                      ),
                    ),
                    // child: Image.asset('assets/images/main.jpg'),
                  ))
              .toList(),
          options: CarouselOptions(
            aspectRatio: 1.5,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            enlargeCenterPage: true,
            autoPlay: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.data.map((url) {
            int index = widget.data.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// return Container(
//   // width: double.infinity,
//   height: kHeight250,
//   decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       image: DecorationImage(
//           fit: BoxFit.fill,
//           image: ExactAssetImage('assets/images/main.jpg'))),
//   // child: Image.asset('assets/images/main.jpg'),
// );
