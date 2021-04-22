import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:shop714/Screens/CartScreen/CartItems/cart_item.dart';
import 'package:shop714/Screens/CartScreen/CartItems/cart_services.dart';
import 'package:shop714/Screens/CartScreen/cart_screen.dart';
import 'package:shop714/Screens/ProductDetail/product_detail_screen.dart';
// import 'package:shop714/Screens/ProductDetail/product_detail_screen.dart';
import 'package:shop714/components/cart_button.dart';
import 'package:shop714/const/const.dart';

class ProductCard extends StatelessWidget {
  String productId;
  String categoryId;
  String title;
  String imageUrl;
  String price;
  String sellPrice;
  String rating;
  String stock;
  ProductCard({
    this.stock,
    this.title,
    this.imageUrl,
    this.rating,
    this.sellPrice,
    this.price,
    this.productId,
    this.categoryId,
  });
  CartServices _cartServices = CartServices();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailScreen.routeName,
            arguments: ProductDetailArgs(
              title: 'Product Details',
              categoryId: categoryId,
              productId: productId,
            ));
      },
      child: Container(
        // width: double.infinity,
        height: kWidth150,
        decoration: BoxDecoration(
          border: Border.all(color: kGreyBorderColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Image(
                    image: FirebaseImage(imageUrl),
                  ),
                  // child: Image.network(imageUrl),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "In Stock $stock",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          '\u{20B9} $sellPrice',
                          style: kLargeBoldPriceTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            'MRP $price',
                            style: kRatingTextStyle.copyWith(
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    CartButton(
                      label: 'Add to Cart',
                      onPressed: () async {
                        CartItem item = CartItem(
                            categoryId: categoryId.toString(),
                            itemId: productId.toString(),
                            quantity: '1');
                        List itm = await _cartServices.addToCart(item);
                        if (itm.length != 0) {
                          Navigator.pushNamed(context, CartScreen.routeName);
                        }
                      },
                      borderRadius: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
