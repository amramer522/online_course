import 'package:flutter/material.dart';

class ItemFree extends StatelessWidget {
  const ItemFree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 355,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 90,
                  margin: EdgeInsetsDirectional.only(end: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xff034C65)
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("This product full name"),
                      Text("Free",style: TextStyle(color: Color(0xff516E00)),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color(0xff707070),
            indent: 100,
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        // color: Colors.red
      ),
    );
  }
}
