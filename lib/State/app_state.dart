import 'package:flutter/material.dart';
import 'package:shop714/Models/category_model.dart';
import 'package:shop714/Models/product_model.dart';
import 'package:shop714/db/firebase_realtime_db.dart';

class AppDataState extends ChangeNotifier {
  FirebaseDbApi _db = FirebaseDbApi();
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];

  void setCategoryList({List<CategoryModel> data}) {
    categoryList = data;
    notifyListeners();
  }

  void setProductList({List<ProductModel> data}) {
    productList = data;
    notifyListeners();
  }

  Future<List<CategoryModel>> getCategoryList() async {
    if (categoryList.length == 0) {
      await _db.getCategoryData().then((value) => categoryList = value);
      notifyListeners();
    }
    return categoryList;
  }

  Future<List<ProductModel>> getProductList() async {
    if (productList.length == 0) {
      await _db.getProductData().then((value) => productList = value);
      notifyListeners();
    }
    return productList;
  }

  Future<List<ProductModel>> getProductsByCategoryId({String id}) async {
    if (productList.length == 0) {
      await _db.getProductData().then((value) => productList = value);
      notifyListeners();
    }
    return productList.where((element) => element.categoryId == id).toList();
  }

  Future<ProductModel> getProductById({String id}) async {
    if (productList.length == 0) {
      await _db.getProductData().then((value) => productList = value);
      notifyListeners();
    }
    return productList.where((element) => element.id == id).first;
  }
}
