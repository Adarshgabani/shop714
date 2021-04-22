class CartItem {
  String categoryId;
  String itemId;
  String quantity;
  CartItem({
    this.categoryId,
    this.itemId,
    this.quantity,
  });
  CartItem.fromMap(Map map)
      : this.itemId = map['itemId'],
        this.categoryId = map['categoryId'],
        this.quantity = map['quantity'];

  Map toMap() {
    return {
      'categoryId': this.categoryId,
      'itemId': this.itemId,
      'quantity': this.quantity,
    };
  }
}
