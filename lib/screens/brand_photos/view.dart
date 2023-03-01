import 'package:flutter/material.dart';

import 'components/item_brand_photo.dart';
import 'model.dart';

class BrandPhotosScreen extends StatelessWidget {
   BrandPhotosScreen({Key? key}) : super(key: key);


  List<BrandPhotoModel> list = [
    BrandPhotoModel(isLiked: false,description: "Hello Description"*30,imageUrl: "https://64.media.tumblr.com/be5c3aed368c3fce141a6c8fc0357cae/tumblr_n4jrscjHLY1scbh3so1_1280.jpg",numberOfLiked: 20,),
    BrandPhotoModel(isLiked: true,description: "Hello Description2"*30,imageUrl: "https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/08/BRAND-YOURSELF-700x420.jpg?auto=format&q=60&fit=max&w=930",numberOfLiked: 30,),
    BrandPhotoModel(isLiked: false,description: "Hello Description3"*30,imageUrl: "https://64.media.tumblr.com/be5c3aed368c3fce141a6c8fc0357cae/tumblr_n4jrscjHLY1scbh3so1_1280.jpg",numberOfLiked: 50,),
    BrandPhotoModel(isLiked: true,description: "Hello Description4"*30,imageUrl: "https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/08/BRAND-YOURSELF-700x420.jpg?auto=format&q=60&fit=max&w=930",numberOfLiked: 70,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brand Photos"),
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
      body: ListView.builder(
        itemBuilder: (context, index) => ItemBrandPhoto(model:list[index] ),
        itemCount: list.length,
      ),
    );
  }
}





