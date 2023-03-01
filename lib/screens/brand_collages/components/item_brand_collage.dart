import 'dart:math';

import 'package:flutter/material.dart';
import 'package:online_course/screens/brand_collages/model.dart';

class ItemBrandCollage extends StatelessWidget {
  final BrandCollageModel model;
  final VoidCallback? onDeletePress;
  const ItemBrandCollage({Key? key,required this.model, this.onDeletePress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(model.userName),
          subtitle: Text(model.createdAt),
          trailing: IconButton(
              onPressed: onDeletePress, icon: Image.asset("assets/icons/download.png")),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                model.userImage),
          ),
        ),
        Image.network(
          model.collageImage,
          height: 379,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(model.collageTitle),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
            IconButton(
                onPressed: () {},
                icon: Image.asset("assets/icons/add_to_cart.png")),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        ElevatedButton(onPressed: () {}, child: Text("Edit collage")),
        SizedBox(
          height: 33,
        ),
        Divider(
          thickness: 8,
          color: Color(0xffE4E4E4),
        )
      ],
    );
  }
}
