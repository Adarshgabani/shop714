import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop714/State/app_state.dart';
import 'package:shop714/components/appbar.dart';
import 'package:shop714/components/button_component.dart';
import 'package:shop714/components/cart_button.dart';
import 'package:shop714/components/text_field_component.dart';
import 'package:shop714/const/const.dart';
import 'package:shop714/db/cloud_firestore.dart';

class OrdersScreen extends StatelessWidget {
  static String routeName = '/changePassword';
  CloudFirestoreAPI _api = CloudFirestoreAPI();
  Future<void> _showMyDialog({BuildContext context, String data}) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 260,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("SCAN QR"),
                        SizedBox(height: 5),
                        QrImage(
                          data: data,
                          size: 200,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: -5,
                      right: 5,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('cancel')))
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AppDataState>(context, listen: false);
    return Scaffold(
      appBar: AppBarWithCartWidget(title: "Your Orders", context: context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(bottom: 10),
          child: FutureBuilder<List<String>>(
              future: _api.getAllOrders(userId: _provider.userId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData == null) {
                  return Container(
                    child: Text('waiting....'),
                  );
                } else if (snapshot.hasData) {
                  if (snapshot.data.length == 0) {
                    return Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.8,
                          // color: Colors.red,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.do_not_disturb,
                                  size: 50,
                                  color: Colors.black26,
                                ),
                              ),
                              SizedBox(height: 10),
                              Center(
                                child: Text(
                                  'No Orders Pending',
                                  style: TextStyle(
                                      fontFamily: 'roboto',
                                      color: Colors.black26),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            child: CartButton(
                              buttonHeight: 50,
                              fontSize: 18,
                              label: "PLACE A NEW ORDER",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  }

                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: Key(snapshot.data[index]),
                          onDismissed: (direction) {
                            print(index);
                            _api.deleteOrder(
                                userId: _provider.userId,
                                orderId: snapshot.data[index]);
                          },
                          background: Container(
                            color: Colors.red,
                          ),
                          child: ListTile(
                            key: Key(snapshot.data[index]),
                            leading: Icon(
                              Icons.qr_code_scanner_sharp,
                              color: Colors.black,
                            ),
                            onTap: () => _showMyDialog(
                                context: context, data: snapshot.data[index]),
                            title: Text("${snapshot.data[index]}"),
                          ),
                        );
                      });
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
              }),
        ),
      ),
    );
  }
}
