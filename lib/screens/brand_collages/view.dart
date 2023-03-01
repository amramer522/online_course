import 'package:flutter/material.dart';
import 'package:online_course/screens/brand_collages/controller.dart';
import 'package:online_course/screens/brand_collages/model.dart';

import 'components/item_brand_collage.dart';

class BrandCollagesScreen extends StatefulWidget {
  BrandCollagesScreen({Key? key}) : super(key: key);

  @override
  State<BrandCollagesScreen> createState() => _BrandCollagesScreenState();
}

class _BrandCollagesScreenState extends State<BrandCollagesScreen> {
  final controller = BrandCollagesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brand Collages"),
        leading: Padding(
          padding: EdgeInsets.all(16),
          child: Image.asset("assets/icons/arrow_back.png"),
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => ItemBrandCollage(
              model: controller.list[index],
              onDeletePress: () {
                controller.deleteItem(index: index);
                setState(() {});
              }),
          itemCount: controller.list.length),
    );
  }
}
