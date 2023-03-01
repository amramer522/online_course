class Book {
  int id;
  String title, description, image;
  bool isFav;

  Book({required this.id, required this.description, required this.title, required this.image, this.isFav =false});

 void toggleFav(){
   isFav=!isFav;
  }


}
