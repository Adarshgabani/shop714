import 'package:firebase_database/firebase_database.dart';
import 'package:shop714/Models/category_model.dart';
import 'package:shop714/Models/product_model.dart';

class FirebaseDbApi {
  DatabaseReference _firebasedb = FirebaseDatabase.instance.reference();
  Future<List<CategoryModel>> getCategoryData() async {
    List data;
    await _firebasedb.once().then((res) {
      data = res.value['categories']['data'];
    });
    print(data);
    return data
        .map((element) => CategoryModel(
            id: element['id'].toString(),
            name: element["name"].toString(),
            imageUrl: element["image_url"].toString(),
            productIds: element["product_ids"]))
        .toList();
  }

  Future<List<ProductModel>> getProductData() async {
    List data;
    await _firebasedb.once().then((res) {
      data = res.value['products']['data'];
      print(data);
    });

    return data
        .map((element) => ProductModel(
            id: element['id'].toString(),
            categoryId: element['category_id'].toString(),
            name: element["name"].toString(),
            description: element['desc'].toString(),
            price: element['price'].toString(),
            sellPrice: element["sell_price"].toString(),
            imageUrl: element["image_url"].toString()))
        .toList();
  }
}
