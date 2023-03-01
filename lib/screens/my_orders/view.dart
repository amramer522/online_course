import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/item_my_order.dart';
import 'model.dart';

class MyOrdersScreen extends StatelessWidget {
   MyOrdersScreen({Key? key}) : super(key: key);

  List<OrderModel> list = [
    OrderModel(orderNumber: 150, date: "20 Dec 2022", time: "10:30 PM", statusOrder: "Delivered", price: 1500,color: 0xff2F1F2B),
    OrderModel(orderNumber: 160, date: "20 Dec 2022", time: "10:30 PM", statusOrder: "Canceled", price: 1500,color: 0xffC61B01),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My orders"),
        leading: Padding(
          padding: EdgeInsets.all(16),
          child: Image.asset("assets/icons/arrow_back.png"),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
          itemBuilder: (context, index) => ItemMyOrder(model: list[index]),itemCount: list.length),
    );
  }
}
