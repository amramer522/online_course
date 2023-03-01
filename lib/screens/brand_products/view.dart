import 'package:flutter/material.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brand Products"),
        leading: Padding(
          padding: EdgeInsets.all(16),
          child: Image.asset("assets/icons/arrow_back.png"),
        ),
        actions: [
          InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Image.asset("assets/icons/filter.png"),
              ))
        ],
      ),
    );
  }
}
