import 'package:flutter/material.dart';
import 'package:shop714/Screens/CartScreen/CartItems/cart_item.dart';
import 'package:shop714/Screens/CartScreen/CartItems/cart_services.dart';
import 'package:shop714/Screens/HomeScreen/home_screen.dart';
import 'package:shop714/components/appbar.dart';
import 'package:shop714/components/cart_button.dart';
import 'package:shop714/components/cart_product.dart';
import 'package:shop714/const/const.dart';
import 'package:shop714/size_config.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatefulWidget {
  static String routeName = '/cart';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartServices cartServices = CartServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // cartItemList = cartServices.loadData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CartScreenAppBarWidget(context: context),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30),
              margin: EdgeInsets.only(bottom: 10),
              child: FutureBuilder<List<CartItem>>(
                future: cartServices.loadData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData == null) {
                    return Container(
                      child: Text('waiting....'),
                    );
                  } else if (snapshot.hasData == null) {
                    return Container(
                      child: Text('Nothing in cart'),
                    );
                  } else if (snapshot.hasData) {
                    print("CART DATA ${snapshot.data.length}");

                    List<CartItem> cartItemList = snapshot.data;
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: [
                                  TextSpan(
                                      text: '${cartItemList.length} Items ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: 'in your cart'),
                                ],
                              )),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      HomeScreen.routeName, (route) => false);
                                },
                                child: Text(
                                  '+ Add more items',
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 74, top: 34),
                          child: NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification: (overScroll) {
                              overScroll.disallowGlow();
                              return;
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  // CartProductCard(),
                                  // SizedBox(
                                  //   height: 10,
                                  // ),
                                  // CartProductCard(),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: cartItemList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      int productId =
                                          int.parse(cartItemList[index].itemId);
                                      int categoryId = int.parse(
                                          cartItemList[index].categoryId);
                                      int quantity = int.parse(
                                          cartItemList[index].quantity);
                                      return Container(
                                        child: CartProductCard(
                                            categoryId: categoryId.toString(),
                                            productId: productId.toString(),
                                            quantity: quantity,
                                            delete: (id) {
                                              setState(() {
                                                cartServices
                                                    .deleteItem(id.toString());
                                              });
                                            }),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 10),
                                      );

                                      return Container();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CartButton(
                  buttonHeight: 50,
                  fontSize: 18,
                  label: 'Proceed To Checkout',
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//  Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     RichText(
//                         text: TextSpan(
//                       style: DefaultTextStyle.of(context).style,
//                       children: [
//                         TextSpan(
//                             text: '2 Items ',
//                             style: TextStyle(fontWeight: FontWeight.bold)),
//                         TextSpan(text: 'in your cart'),
//                       ],
//                     )),
//                     Text(
//                       '+ Add more items',
//                       style: TextStyle(color: Colors.red),
//                     )
//                   ],
//                 ),
//               ),
//               CartProductCard(),
//               SizedBox(
//                 height: 10,
//               ),
//               CartProductCard(),
//             ],
//           ),
