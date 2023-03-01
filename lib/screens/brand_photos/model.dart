class BrandPhotoModel {
  late String imageUrl, description;
  late bool isLiked;
  late int numberOfLiked;

  BrandPhotoModel(
      {required this.imageUrl,
      required this.description,
      required this.isLiked,
      required this.numberOfLiked});
}
