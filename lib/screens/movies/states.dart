import 'model.dart';

class MoviesStates {}

class GetMovieLoading extends MoviesStates {}

class GetMovieSuccess extends MoviesStates {
  final List<Movie> list;

  GetMovieSuccess({required this.list});
}

class GetMovieFailed extends MoviesStates {
  final String massage;

  GetMovieFailed({required this.massage});
}
