import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop714/Screens/Auth/firebase_api.dart';
import 'package:shop714/Screens/Categories/Categories.dart';
import 'package:shop714/State/app_state.dart';
import 'package:shop714/components/appbar.dart';
import 'package:shop714/components/horizontal_listview.dart';
import 'package:shop714/components/main_screen_image.dart';
import 'package:shop714/db/firebase_realtime_db.dart';
import 'package:shop714/size_config.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var _provider = Provider.of<AppDataState>(context);
    return Scaffold(
        appBar: AppBarWidget(context),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.only(bottom: 10),
              child: SingleChildScrollView(
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
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
