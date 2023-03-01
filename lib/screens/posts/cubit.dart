import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/screens/posts/states.dart';

import 'model.dart';

class PostsCubit extends Cubit<PostsStates> {
  PostsCubit() : super(PostsStates());

  Future<void> getPosts() async {
    emit(GetPostsLoading());
    var response = await Dio().get("https://jsonplaceholder.typicode.com/photos").catchError((err) {
      emit(GetPostsFailed(massage: err.toString()));
    });

    List<Post> postsList = [];
    List<dynamic> jsonList = response.data;
    jsonList.forEach((element) {
      postsList.add(Post.fromJson(element));
    });

    print(jsonList.length);
    print(postsList.length);

    emit(GetPostsSuccess(list: postsList));
  }
}
