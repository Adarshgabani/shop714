import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop714/Models/product_model.dart';
import 'package:shop714/Screens/CartScreen/cart_screen.dart';
import 'package:shop714/State/app_state.dart';
import 'package:shop714/components/appbar.dart';
import 'package:shop714/components/product_card.dart';
import 'package:shop714/const/const.dart';
import 'package:shop714/size_config.dart';
import 'package:shimmer/shimmer.dart';

class CategoryArgs {
  final String title;
  String categoryId;
  CategoryArgs({this.title, @required this.categoryId});
}

class CategoryScreen extends StatelessWidget {
  static String routeName = '/category';

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AppDataState>(context);
    final CategoryArgs args = ModalRoute.of(context).settings.arguments;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithCartWidget(context: context, title: args.title),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(bottom: 10),
            child: FutureBuilder<List<ProductModel>>(
              future: _provider.getProductsByCategoryId(id: args.categoryId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData == null) {
                  return Container(
                    child: Text('waiting....'),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    // scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      ProductModel product = snapshot.data[index];
                      print('-------${product?.imageUrl}');

                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: ProductCard(
                          productId: product.id,
                          categoryId: product.categoryId,
                          sellPrice: product.sellPrice.toString(),
                          price: product.price.toString(),
                          title: product.name ?? 'title',
                          imageUrl: product?.imageUrl ??
                              'https://cdn1.iconfinder.com/data/icons/business-company-1/500/image-512.png',
                        ),
                      );
                    },
                  );
                } else {
                  return Shimmer.fromColors(
                      child: Container(
                        height: kWidth170,
                        decoration: BoxDecoration(
                            color: kGreyBGColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      baseColor: kGreyBGColor,
                      highlightColor: Colors.white);
                }
              },
            )),
      ),
    );
  }
}

// ListView(
//             children: [
//               ProductCard(),
//               SizedBox(
//                 height: 10,
//               ),
//               ProductCard(),
//             ],
//           ),
