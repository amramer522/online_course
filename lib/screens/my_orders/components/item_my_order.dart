import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model.dart';

class ItemMyOrder extends StatelessWidget {
  final OrderModel model;
  const ItemMyOrder({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            spreadRadius: 2,
            blurRadius: 80,
            offset: Offset(5,20)
          )
        ]
      ),
      child: Card(
        margin: EdgeInsets.only(top: 20),
        elevation: 1.5,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(top: 20,bottom: 16,start: 17,end:15 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order #${model.orderNumber}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationThickness: 3),),
            SizedBox(height: 9,),
              Text("${model.date} ${model.time}",style: TextStyle(fontSize: 17,color: Color(0xff7B7B7B)),),
              SizedBox(height: 9,),
              Text("LE ${model.price}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
              Align(alignment: AlignmentDirectional.bottomEnd,child: Text(model.statusOrder,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(model.color)),)),
            ],
          ),
        ),
      ),
    );
  }
}
