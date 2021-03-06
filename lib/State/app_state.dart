import 'package:flutter/material.dart';
import 'package:shop714/Models/ads_model.dart';
import 'package:shop714/Models/category_model.dart';
import 'package:shop714/Models/product_model.dart';
import 'package:shop714/db/firebase_realtime_db.dart';

class AppDataState extends ChangeNotifier {
  String userId;
  String userEmail;
  bool isData = false;
  FirebaseDbApi _db = FirebaseDbApi();
  List<CategoryModel> categoryList = [];
  List<ProductModel> productList = [];
  List<AdsModel> adsList = [];

  void toggleIsData() {
    isData = !isData;
    notifyListeners();
  }

  void setUserIdAndEmail({String id, String email}) {
    userId = id;
    userEmail = email;
    notifyListeners();
  }

  // void setUserEmail({String email}) {
  //   userEmail = email;
  //   notifyListeners();
  // }

  void setCategoryList({List<CategoryModel> data}) {
    categoryList = data;
    notifyListeners();
  }

  void setProductList({List<ProductModel> data}) {
    productList = data;
    notifyListeners();
  }

  Future<List<AdsModel>> getAdsList() async {
    if (adsList.length == 0) {
      await _db.getAdsData().then((value) => adsList = value);
      notifyListeners();
    }
    return adsList;
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
