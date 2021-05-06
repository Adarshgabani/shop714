import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudFirestoreAPI {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<String> addOrder({data, @required userId}) async {
    return await users
        .doc(userId)
        .collection("orders")
        .add(data)
        .then((value) => value.id);
  }

  Future<List<String>> getAllOrders({String userId}) async {
// List<String> ls=
    return await users
        .doc(userId)
        .collection('orders')
        .get()
        .then((QuerySnapshot qs) {
      return qs.docs.map((element) => element.id).toList();
    });
  }

  Future<void> deleteOrder({String orderId, @required userId}) async {
    await users
        .doc(userId)
        .collection('orders')
        .doc(orderId)
        .delete()
        .then((value) => print("order deleted successfully"));
  }
}
