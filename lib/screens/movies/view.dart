import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/screens/movies/cubit.dart';
import 'package:online_course/screens/movies/states.dart';

import 'components/item_movie.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit()..getMovies(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movies Screen"),
        ),
        body: BlocBuilder<MoviesCubit,MoviesStates>(
          builder: (context, state) {
            if (state is GetMovieLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetMovieFailed) {
              return Center(
                child: Text(state.massage),
              );
            } else if (state is GetMovieSuccess) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: state.list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 195 / 300),
                itemBuilder: (context, index) => ItemMovie(
                  model: state.list[index],
                ),
              );
            } else {
              return Text("Something wrong");
            }
          },
        ),
      ),
    );
  }
}
