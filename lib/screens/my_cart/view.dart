import 'package:flutter/material.dart';
import 'package:online_course/screens/my_cart/components/item_cart.dart';
import 'package:online_course/screens/my_cart/components/item_free.dart';
import 'package:online_course/screens/my_cart/components/item_price.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Image.asset("assets/icons/arrow_back.png"),
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: List.generate(5, (index) => ItemCart()),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 18,bottom: 15),
            child: Text("Free Items",style: TextStyle(color: Color(0xff516E00),fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Column(
            children: List.generate(5, (index) => ItemFree()),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                ItemPrice(title: "Subtotal", price: "LE 0,00"),
                ItemPrice(title: "Shipping Fees", price: "LE 0,00"),
                ItemPrice(title: "VAT", price: "LE 0,00"),
                Divider(color: Color(0xff707070),),
                ItemPrice(title: "Total Fees", price: "LE  0,00",isBold: true),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: ElevatedButton(onPressed: (){}, child: Text("Continue"),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              fixedSize: const Size(264,44)
            ),),
          ),
          SizedBox(height: 100,),

        ],
      ),
    );
  }
}
