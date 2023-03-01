import 'package:flutter/material.dart';

import '../model.dart';

class ItemBrandPhoto extends StatefulWidget {
  final BrandPhotoModel model;
  const ItemBrandPhoto({Key? key,required this.model}) : super(key: key);

  @override
  State<ItemBrandPhoto> createState() => _ItemBrandPhotoState();
}

class _ItemBrandPhotoState extends State<ItemBrandPhoto> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          widget.model.imageUrl,
          height: 390,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Row(
          children: [
            IconButton(onPressed: ()
            {
              widget.model.isLiked  = !widget.model.isLiked;
              setState(() {});

            }, icon: Icon(widget.model.isLiked?Icons.favorite:Icons.favorite_border,color: widget.model.isLiked?Colors.red:null,)),
            Text("liked by ${widget.model.numberOfLiked} others"),
            const Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 14),
          child: Text(widget.model.description),
        ),
        SizedBox(height: 40,)
      ],
    );
  }
}
