import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop714/Models/product_model.dart';
import 'package:shop714/Screens/Category/category_screen.dart';
import 'package:shop714/Screens/ProductDetail/product_detail_screen.dart';
import 'package:shop714/State/app_state.dart';
import 'package:shop714/components/item_card.dart';
import 'package:shop714/const/const.dart';
import 'package:shimmer/shimmer.dart';

class ProductHorizontalListView extends StatelessWidget {
  String routeName;
  String title;
  String categoryId;
  String productId;
  ProductHorizontalListView({
    @required this.routeName,
    @required this.categoryId,
    @required this.title,
    this.productId = "-1",
  });
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AppDataState>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: kWidth250,
              child: Text(title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kSmallTextStyle.copyWith(
                      fontFamily: 'Playfair',
                      fontSize: 18,
                      fontWeight: FontWeight.w300)
                  // kLargeBoldTextStyle,
                  ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, routeName,
                    arguments:
                        CategoryArgs(title: title, categoryId: categoryId));
              },
              child: Container(
                child: Row(
                  children: [
                    Text('View all ',
                        style: kSmallTextStyle.copyWith(
                            fontFamily: 'Playfair',
                            fontSize: 14,
                            color: kBlueColor)
                        // kSmallTextStyle.copyWith(fontWeight: FontWeight.w600),
                        ),
                    SizedBox(
                      width: 20,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: kBlueColor,
                      ),
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
          child: FutureBuilder<List<ProductModel>>(
            future: _provider.getProductsByCategoryId(id: categoryId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData == null) {
                return Container(
                  child: Text('waiting....'),
                );
              } else if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    ProductModel product = snapshot.data[index];
                    print('-------${product?.name}');
                    if (productId == product.id) {
                      return Container();
                    }
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      child: ItemCard(
                        routeArguments: ProductDetailArgs(
                            categoryId: categoryId,
                            productId: product.id,
                            title: 'Product Details'),
                        routeName: ProductDetailScreen.routeName,
                        bgColor: Color.fromRGBO(253, 253, 253, 1),
                        title: product.name ?? 'title',
                        imageUrl: product?.imageUrl ??
                            'https://cdn1.iconfinder.com/data/icons/business-company-1/500/image-512.png',
                      ),
                    );
                  },
                );
              } else {
                return Shimmer.fromColors(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: kGreyBGColor,
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.only(right: 10),
                          height: kWidth170,
                          width: kWidth170,
                        ),
                        Container(
                          height: kWidth170,
                          width: kWidth170 - 10,
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
