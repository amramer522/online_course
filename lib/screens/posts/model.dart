class Post {
  late final int albumId;
  late final int id;
  late final String title;
  late final String url;
  late final String thumbnailUrl;

  Post.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId']??0;
    id = json['id']??0;
    title = json['title']??"";
    url = json['url']??"https://cdn-icons-png.flaticon.com/512/2797/2797387.png";
    thumbnailUrl = json['thumbnailUrl']??"";
  }
}


