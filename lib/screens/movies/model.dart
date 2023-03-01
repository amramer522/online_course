class MoviesData {
  late final int page;
  late final List<Movie> list;
  late final int totalPages;
  late final int totalResults;

  MoviesData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    list = List.from(json['results']).map((e) => Movie.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class Movie {
  late final bool isAdult;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage,
      title,
      originalTitle,
      overview,
      backdropPath,
      posterPath,
      releaseDate;

  late final num popularity;
  late final bool video;
  late final num? voteAverage;
  late final int voteCount;

  Movie.fromJson(Map<String, dynamic> json) {
    isAdult = json['adult'] ?? false;
    backdropPath = json['backdrop_path'] ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png";
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'] ?? 0;
    originalLanguage = json['original_language'] ?? "en";
    originalTitle = json['original_title'] ?? "";
    overview = json['overview'] ?? "";
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
