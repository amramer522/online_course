import 'package:flutter/material.dart';

import '../model.dart';

class ItemBaby extends StatelessWidget {
  final Baby model;
  const ItemBaby({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(model.name)
      ],
    );
  }
}
