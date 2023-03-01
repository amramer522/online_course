import 'package:flutter/material.dart';

import 'components/item_category.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories List"),
        leading: Padding(
          padding: EdgeInsets.all(16),
          child: Image.asset("assets/icons/arrow_back.png"),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 19,bottom: 19),
            child: Text("Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          ...List.generate(3, (index) => ItemCategory()),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 19,bottom: 19),
            child: Text("Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          ...List.generate(3, (index) => ItemCategory()),
          Center(
            child: ElevatedButton(onPressed: (){}, child: Text("Add to Editor"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  fixedSize: const Size(264,44)
              ),),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}
