import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop714/Screens/CartScreen/CartItems/cart_item.dart';

class CartServices {
  List<CartItem> list = [];
  Future<List<CartItem>> addToCart(CartItem item) async {
    list = await loadData();
    SharedPreferences _pref = await SharedPreferences.getInstance();
    List x = list.where((element) => element.itemId == item.itemId).toList();
    print("ADD TO CART CALL loadData ${list.length} ");
    if (x.length != 0) {
      list.forEach((element) {
        if (element.itemId == item.itemId) {
          int q = int.parse(element.quantity) + int.parse(item.quantity);
          if (q > 10) {
            element.quantity = (10).toString();
          } else {
            element.quantity = (q).toString();
          }
        }
      });
    } else {
      list.add(item);
    }

    List<String> splist = list.map((e) => json.encode(e.toMap())).toList();
    _pref.setStringList('cartItems', splist);
    return list;
  }

  Future<void> modifyQuantity(String itemId, String quantity) async {
    list = await loadData();
    SharedPreferences _pref = await SharedPreferences.getInstance();

    List x = list.where((element) => element.itemId == itemId).toList();
    if (x.length != 0) {
      list.forEach((element) {
        if (element.itemId == itemId) {
          element.quantity = (quantity).toString();
        }
      });
    } else {
      print('nothing changed... quantity');
    }

    List<String> splist = list.map((e) => json.encode(e.toMap())).toList();
    _pref.setStringList('cartItems', splist);
  }

  Future<List<CartItem>> loadData() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    List<String> temp = _pref.getStringList('cartItems');
    if (temp != null) {
      list = temp.map((i) => CartItem.fromMap(json.decode(i))).toList();
    } else {
      list = [];
    }

    return list;
  }

  Future<void> clearSP() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.clear();
  }

  Future<void> deleteItem(String itemId) async {
    list = await loadData();

    SharedPreferences _pref = await SharedPreferences.getInstance();

    List x = list.where((element) => element.itemId == itemId).toList();
    if (x.length != 0) {
      int index = list.indexOf(x[0]);
      list.removeAt(index);
    } else {
      print('nothing to delete');
    }

    List<String> splist = list.map((e) => json.encode(e.toMap())).toList();
    _pref.setStringList('cartItems', splist);
  }
}
