import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop714/Models/product_model.dart';
import 'package:shop714/Screens/CartScreen/CartItems/cart_services.dart';
import 'package:shop714/Screens/ProductDetail/product_detail_screen.dart';
import 'package:shop714/State/app_state.dart';
import 'package:shop714/components/counter.dart';
import 'package:shop714/const/const.dart';
import 'package:shimmer/shimmer.dart';

class CartProductCard extends StatelessWidget {
  String productId;
  int quantity;
  String categoryId;
  double rating;
  Function delete;
  CartProductCard(
      {@required this.productId,
      @required this.categoryId,
      @required this.quantity,
      this.delete});

  CartServices _cartServices = CartServices();

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AppDataState>(context);
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductDetailScreen.routeName,
              arguments: ProductDetailArgs(
                  title: 'Product Details',
                  categoryId: categoryId.toString(),
                  productId: productId.toString()));
        },
        child: FutureBuilder<ProductModel>(
          future: _provider.getProductById(id: productId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData == null) {
              return Container(
                child: Text('waiting....'),
              );
            } else if (snapshot.hasData) {
              ProductModel product = snapshot.data;
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
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
                                image: FirebaseImage(product.imageUrl),
                              ),
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
                                  product.name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\u{20B9} ${product.sellPrice}',
                                      style: kLargeBoldPriceTextStyle,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 5),
                                      child: Text(
                                        'MRP ${product.price}',
                                        style: kRatingTextStyle.copyWith(
                                          fontSize: 10,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationThickness: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Counter(
                                  maxValue: 10,
                                  minValue: 1,
                                  counterValue: quantity,
                                  onChanged: (val) {
                                    // CartItem item = CartItem(
                                    //     itemId: productId.toString(),
                                    //     quantity: quantity.toString());
                                    _cartServices.modifyQuantity(
                                        productId.toString(), val.toString());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: InkWell(
                      // onTap: () {
                      //   _cartServices.deleteItem(productId.toString());
                      //   print('Deleted');
                      // },
                      onTap: () => delete(productId),
                      child: Container(
                        padding: EdgeInsets.all(3),
                        child: Text(
                          'Delete',
                          style: kDeleteTextStyle,
                        ),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Shimmer.fromColors(
                  child: Container(
                    height: kWidth170,
                    decoration: BoxDecoration(
                        color: kGreyBGColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  baseColor: kGreyBGColor,
                  highlightColor: Colors.white);
            }
          },
        ));
  }
}

// Stack(
// children: [
// Container(
// width: double.infinity,
// height: kWidth150,
// decoration: BoxDecoration(
// border: Border.all(color: kGreyBorderColor),
// borderRadius: BorderRadius.circular(10),
// ),
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// Expanded(
// flex: 2,
// child: Center(
// child: Container(
// child: Image.asset('assets/images/product.png'),
// ),
// ),
// ),
// Expanded(
// flex: 3,
// child: Container(
// padding: EdgeInsets.all(10),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Extra Long Shower Hose 79 Inches',
// maxLines: 2,
// overflow: TextOverflow.ellipsis,
// ),
// RatingWidget(rating: 5),
// Row(
// children: [
// Text(
// '\u{20B9} 300',
// style: kLargeBoldPriceTextStyle,
// ),
// Padding(
// padding: const EdgeInsets.only(left: 10, top: 5),
// child: Text(
// 'MRP 450',
// style: kRatingTextStyle.copyWith(
// fontSize: 10,
// decoration: TextDecoration.lineThrough,
// decorationThickness: 2,
// ),
// ),
// ),
// ],
// ),
// Counter(
// maxValue: 10,
// minValue: 1,
// onChanged: (val) {
// print('object, $val');
// },
// ),
// ],
// ),
// ),
// ),
// ],
// ),
// ),
// Positioned(
// right: 10,
// bottom: 10,
// child: InkWell(
// onTap: () {
// print('Deleted');
// },
// child: Container(
// padding: EdgeInsets.all(3),
// child: Text(
// 'Delete',
// style: kDeleteTextStyle,
// ),
// ),
// ),
// )
// ],
// ),
