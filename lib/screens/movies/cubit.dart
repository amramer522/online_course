import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/screens/books/cubit.dart';
import 'package:online_course/screens/movies/states.dart';

import 'model.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit() : super(MoviesStates());

  Future<void> getMovies() async {
    emit(GetMovieLoading());
    var response = await Dio().get('https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=2')
        .catchError((err) {
      emit(GetMovieFailed(massage: err.toString()));
    });
    MoviesData model = MoviesData.fromJson(response.data);
    emit(GetMovieSuccess(list: model.list));
  }
}
