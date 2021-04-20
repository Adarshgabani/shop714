import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop714/Models/product_model.dart';
import 'package:shop714/Screens/CartScreen/cart_screen.dart';
import 'package:shop714/Screens/Categories/Categories.dart';
import 'package:shop714/Screens/Category/category_screen.dart';
import 'package:shop714/State/app_state.dart';
import 'package:shop714/components/appbar.dart';
import 'package:shop714/components/button_component.dart';
import 'package:shop714/components/cart_button.dart';
import 'package:shop714/components/description_text.dart';
import 'package:shop714/components/detail_screen_image.dart';
import 'package:shop714/components/horizontal_listview.dart';
import 'package:shop714/components/numeric_counter.dart';
import 'package:shop714/components/product_horizontal_listview.dart';
import 'package:shop714/const/const.dart';
import 'package:shop714/size_config.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailArgs {
  String productId;
  String categoryId;
  final String title;
  ProductDetailArgs({this.title, this.productId, this.categoryId});
}

class ProductDetailScreen extends StatelessWidget {
  int quantity = 1;

  static String routeName = '/productdetail';

  // to remove html tags from description
  String removeAllHTMLTages(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  String calculateDiscount(String regular_price, String price) {
    int regularPrice = int.parse(regular_price);
    int salePrice = int.parse(price);

    int percentage =
        (((regularPrice - salePrice) / regularPrice) * 100).toInt();
    return percentage.toString();
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AppDataState>(context);
    final ProductDetailArgs args = ModalRoute.of(context).settings.arguments;
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithCartWidget(context: context, title: args.title),
      body: SafeArea(
        child: FutureBuilder<ProductModel>(
            future: _provider.getProductById(id: args.productId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData == null) {
                return Container(
                  child: Text('waiting....'),
                );
              } else if (snapshot.hasData) {
                ProductModel product = snapshot.data;
                print('xxxxxxxxxxxxxxxx');
                print(snapshot.data);
                return Container(
                  // padding: EdgeInsets.symmetric(horizontal: 30),
                  margin: EdgeInsets.only(bottom: 10),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 30, left: 30, bottom: 10),
                        child: DetailScreenImage(url: product.imageUrl),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              product.name,
                                              style:
                                                  kLargeBoldTextStyle.copyWith(
                                                      fontWeight:
                                                          FontWeight.w500),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${calculateDiscount(product.price, product.sellPrice)}% OFF',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '\u{20B9} ${product.sellPrice}',
                                          style: kLargeBoldPriceTextStyle,
                                        ),
                                        Text(
                                          'MRP ${product.price}',
                                          style: kRatingTextStyle.copyWith(
                                            fontSize: 10,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationThickness: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: NumericCounterButton(
                                      counterValue: quantity,
                                      minValue: 1,
                                      maxValue: 10,
                                      onChanged: (val) {
                                        print(val);
                                        quantity = val;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: CartButton(
                                      label: 'Add to Cart',
                                      onPressed: () async {
                                        // CartItem item = CartItem(
                                        //     categoryId:
                                        //         args.categoryId.toString(),
                                        //     itemId:
                                        //         product.productId.toString(),
                                        //     quantity: quantity.toString());
                                        // List itm =
                                        //     await _cartService.addToCart(item);
                                        // if (itm.length != 0) {
                                        //   Navigator.pushNamed(
                                        //       context, CartScreen.routeName);
                                        // }
                                      },
                                      buttonHeight: kWidth40,
                                      buttonWidht: kWidth150,
                                      borderRadius: 4,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              child: Container(
                                color: kGreyBGColor,
                              ),
                              width: double.infinity,
                              height: 5,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: DescriptionText(
                                title: 'Description',
                                description:
                                    removeAllHTMLTages(product.description),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              child: Container(
                                color: kGreyBGColor,
                              ),
                              width: double.infinity,
                              height: 5,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: ProductHorizontalListView(
                                  categoryId: args.categoryId,
                                  title: 'Similar Product',
                                  routeName: CategoryScreen.routeName),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Shimmer.fromColors(
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      height: kHeight300,
                      decoration: BoxDecoration(
                          color: kGreyBGColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    baseColor: kGreyBGColor,
                    highlightColor: Colors.white);
              }
            }),
      ),
    );
  }
}
