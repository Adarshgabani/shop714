import 'package:flutter/cupertino.dart';

class ProductModel {
  String id;
  String categoryId;
  String name;
  String description;
  String imageUrl;
  String price;
  String sellPrice;

  ProductModel({
    this.id,
    this.categoryId,
    this.description,
    this.imageUrl,
    this.name,
    this.price,
    this.sellPrice,
  });
}
