import 'package:flutter/material.dart';

import '../model.dart';

class ItemMovie extends StatelessWidget {
  final Movie model;

  const ItemMovie({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              child: Image.network(
            "https://image.tmdb.org/t/p/original${model.backdropPath}",
            errorBuilder: (context, error, stackTrace) => Image.network(
              "https://cdn-icons-png.flaticon.com/512/2797/2797387.png",
              height: 50,
              width: 50,
            ),
            fit: BoxFit.fill,
          )),
          Text(model.title)
        ],
      ),
    );
  }
}
