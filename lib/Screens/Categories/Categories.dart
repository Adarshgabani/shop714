import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop714/Models/category_model.dart';
import 'package:shop714/Screens/CartScreen/cart_screen.dart';
import 'package:shop714/Screens/Category/category_screen.dart';
import 'package:shop714/State/app_state.dart';
import 'package:shop714/components/appbar.dart';
import 'package:shop714/components/item_card.dart';
import 'package:shop714/const/const.dart';
import 'package:shop714/size_config.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesArgs {
  final String title;
  CategoriesArgs({this.title});
}

class CategoriesScreen extends StatelessWidget {
  static String routeName = '/categories';

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AppDataState>(context);
    final CategoriesArgs args = ModalRoute.of(context).settings.arguments;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithCartWidget(context: context, title: args.title),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(bottom: 10),
        child: FutureBuilder<List<CategoryModel>>(
            future: _provider.getCategoryList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData == null) {
                return Container(
                  child: Text('waiting....'),
                );
              } else if (snapshot.hasData) {
                return GridView.builder(
                    itemCount: snapshot.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      CategoryModel category = snapshot.data[index];

                      return ItemCard(
                        routeName: CategoryScreen.routeName,
                        routeArguments: CategoryArgs(
                          categoryId: category.id,
                          title: category.name,
                        ),
                        title: category.name,
                        imageUrl: category?.imageUrl ??
                            'https://cdn1.iconfinder.com/data/icons/business-company-1/500/image-512.png',
                      );
                    });
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
                          width: kWidth170,
                          decoration: BoxDecoration(
                              color: kGreyBGColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ],
                    ),
                    baseColor: kGreyBGColor,
                    highlightColor: Colors.white);
              }
            }),
      )),
    );
  }
}

// GridView.count(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 children: [
//                   ItemCard(),
//                   ItemCard(),
//                   ItemCard(),
//                   ItemCard(),
//                   ItemCard(),
//                   ItemCard(),
//                   ItemCard(),
//                   ItemCard(),
//                 ],
//               ),
