import 'package:flutter/material.dart';
import 'package:shop714/Models/category_model.dart';
import 'package:shop714/Screens/Categories/Categories.dart';
import 'package:shop714/Screens/Category/category_screen.dart';
// import 'package:shop714/Screens/Categories/Categories.dart';
// import 'package:shop714/Screens/Category/category_screen.dart';
import 'package:shop714/components/item_card.dart';
import 'package:shop714/const/const.dart';
import 'package:shop714/size_config.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalListView extends StatelessWidget {
  Future<List<dynamic>> future;
  String routeName;
  String title;
  HorizontalListView({
    @required this.routeName,
    this.future,
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
    print('${kWidth170}   ${SizeConfig.screenWidth} ');
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: kLargeBoldTextStyle,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, routeName,
                    arguments: CategoriesArgs(title: 'Categories'));
              },
              child: Container(
                child: Row(
                  children: [
                    Text(
                      'View all ',
                      style:
                          kSmallTextStyle.copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 15,
                      child: Icon(Icons.arrow_forward),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: kWidth170,
          child: FutureBuilder<List<CategoryModel>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData == null) {
                return Container(
                  child: Text('waiting....'),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    CategoryModel category = snapshot.data[index];
                    print('-------${category?.id}');
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: ItemCard(
                        routeArguments: CategoryArgs(
                            categoryId: category.id, title: category.name),
                        routeName: CategoryScreen.routeName,
                        title: category.name ?? 'title',
                        categoryId: category?.id,
                        imageUrl: category?.imageUrl ??
                            'https://cdn1.iconfinder.com/data/icons/business-company-1/500/image-512.png',
                      ),
                    );
                  },
                );
              } else {
                // return SizedBox(
                //   child: CircularProgressIndicator(),
                //   height: 120,
                //   width: 120,
                // );
                return Shimmer.fromColors(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: kGreyBGColor,
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.only(right: 10),
                          height: kWidth170,
                          width: kWidth170 - 5,
                        ),
                        Container(
                          height: kWidth170,
                          width: kWidth170 - 5,
                          decoration: BoxDecoration(
                              color: kGreyBGColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                    baseColor: kGreyBGColor,
                    highlightColor: Colors.white);
              }
            },
          ),
        ),
      ],
    );
  }
}

// ListView(
//             scrollDirection: Axis.horizontal,
//             children: [
//               ItemCard(
//                 title: 'Flutter',
//                 imageUrl:
//                     'https://www.signitysolutions.com/blog/wp-content/uploads/2020/04/Flutter-app-development-signity-solutions-1024x512.png',
//               ),
//               SizedBox(width: 10),
//               ItemCard(
//                 title: 'Flutter',
//                 imageUrl:
//                     'https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
//               ),
//               SizedBox(width: 10),
//               ItemCard(
//                 title: 'Flutter',
//                 imageUrl:
//                     'https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
//               ),
//               SizedBox(width: 10),
//               ItemCard(
//                 title: 'Flutter',
//                 imageUrl:
//                     'https://miro.medium.com/max/1000/1*ilC2Aqp5sZd1wi0CopD1Hw.png',
//               ),
//             ],
//           ),
