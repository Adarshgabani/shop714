import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:shop714/Models/ads_model.dart';
import 'package:shop714/Models/category_model.dart';
import 'package:shop714/Models/product_model.dart';

class FirebaseDbApi {
  DatabaseReference _firebasedb = FirebaseDatabase.instance.reference();
  Future<List<CategoryModel>> getCategoryData() async {
    print("______________getCategoryData Called_____________");
    List data;
    await _firebasedb.once().then((res) {
      data = res.value['categories']['data'];
    });
    print('------data:${data}');

    return data.map((element) {
      log(element.toString());
      return CategoryModel(id: element['id'].toString(), name: element["name"].toString(), imageUrl: element["image_url"].toString(), productIds: element["product_ids"]);
    }).toList();
  }

  Future<List<ProductModel>> getProductData() async {
    print("______________getProductData Called_____________");

    List data;
    await _firebasedb.once().then((res) {
      data = res.value['products']['data'];
    });

    return data
        .map((element) => ProductModel(
              id: element['id'].toString(),
              categoryId: element['category_id'].toString(),
              name: element["name"].toString(),
              description: element['desc'].toString(),
              price: element['price'].toString(),
              sellPrice: element["sell_price"].toString(),
              imageUrl: element["image_url"].toString(),
              stock: element['stock'].toString(),
            ))
        .toList();
  }

  Future<List<AdsModel>> getAdsData() async {
    List data;

    await _firebasedb.once().then((res) {
      data = res.value['ads']['data'];
    });

    return data.map((e) => AdsModel(imageUrl: e["image_url"].toString())).toList();
  }
}
