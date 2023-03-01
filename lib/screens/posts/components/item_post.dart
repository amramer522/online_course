import 'package:flutter/material.dart';

import '../model.dart';

class ItemPost extends StatelessWidget {
  final Post model;

  const ItemPost({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            errorBuilder: (context, error, stackTrace) => Image.asset("assets/images/app_logo.png"),
          ),
          Text(model.title)
        ],
      ),
    );
  }
}
