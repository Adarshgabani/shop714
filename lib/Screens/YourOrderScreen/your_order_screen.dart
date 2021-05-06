import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shop714/Screens/HomeScreen/home_screen.dart';
import 'package:shop714/components/appbar.dart';
import 'package:shop714/components/link_text_component.dart';

class YourOrderArgs {
  final String orderId;
  YourOrderArgs({this.orderId});
}

class YourOrderScreen extends StatelessWidget {
  static String routeName = '/yourOrder';
  @override
  Widget build(BuildContext context) {
    final YourOrderArgs args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithCartWidget(context: context, title: "Your Order"),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Your Order is Confirmed.Thank you for shopping with us.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Your Order ID is",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 5),
                    Text(args.orderId),
                    SizedBox(height: 50),
                    QrImage(
                      size: 200,
                      data: args.orderId,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 10,
                child: LinkText(
                  link: "Continue Shopping",
                  textMessage: " ",
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeScreen.routeName, (route) => false);
                  },
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text("Show this QR to Cashier while pickup")),
            ],
          ),
        ),
      ),
    );
  }
}
