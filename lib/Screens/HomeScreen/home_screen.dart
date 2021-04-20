import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop714/Models/category_model.dart';
import 'package:shop714/Screens/Auth/firebase_api.dart';
import 'package:shop714/Screens/Categories/Categories.dart';
import 'package:shop714/Screens/Category/category_screen.dart';
import 'package:shop714/State/app_state.dart';
import 'package:shop714/components/appbar.dart';
import 'package:shop714/components/horizontal_listview.dart';
import 'package:shop714/components/main_screen_image.dart';
import 'package:shop714/components/product_horizontal_listview.dart';
import 'package:shop714/const/const.dart';
import 'package:shop714/db/firebase_realtime_db.dart';
import 'package:shop714/size_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';
  FirebaseDbApi _firebaseDbApi = FirebaseDbApi();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _provider = Provider.of<AppDataState>(context);
    Future<void> _fetchData() async {
      await _firebaseDbApi
          .getProductData()
          .then((value) => _provider.setProductList(data: value));
      await _firebaseDbApi
          .getCategoryData()
          .then((value) => _provider.setCategoryList(data: value));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(context),
        body: RefreshIndicator(
          color: Colors.orange,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          onRefresh: _fetchData,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(bottom: 10),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  MainScreenImage(),
                  SizedBox(
                    height: 30,
                  ),
                  HorizontalListView(
                    title: 'Categories',
                    future: _provider.getCategoryList(),
                    routeName: CategoriesScreen.routeName,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FutureBuilder<List<CategoryModel>>(
                      future: _provider.getCategoryList(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData == null) {
                          return Container(
                            child: Text('waiting....'),
                          );
                        } else if (snapshot.hasData) {
                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: ProductHorizontalListView(
                                    routeName: CategoryScreen.routeName,
                                    title: snapshot.data[index].name,
                                    categoryId: snapshot.data[index].id,
                                  ),
                                );
                              });
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
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
