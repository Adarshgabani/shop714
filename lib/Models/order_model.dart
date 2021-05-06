class OrderModel {
  String productId;
  int quantity;

  OrderModel({
    this.productId,
    this.quantity,
  });

  OrderModel.fromMap(Map map)
      : this.productId = map['product_id'],
        this.quantity = map['quantity'];

  Map toMap() {
    return {
      'product_id': this.productId,
      'quantity': this.quantity,
    };
  }
}
