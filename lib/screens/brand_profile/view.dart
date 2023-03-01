
import 'package:flutter/material.dart';

class BrandProfileScreen extends StatelessWidget {
  const BrandProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brand Profile"),
        leading: Padding(
          padding: EdgeInsets.all(16),
          child: Image.asset("assets/icons/arrow_back.png"),
        ),
      ),
    );
  }
}
