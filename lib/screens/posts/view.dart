import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/screens/posts/states.dart';

import 'components/item_post.dart';
import 'cubit.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
        PostsCubit()
          ..getPosts(),
        child: BlocBuilder<PostsCubit,PostsStates>(
          builder: (context, state) {
            if (state is GetPostsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetPostsFailed) {
              return Center(
                child: Text(state.massage),
              );
            } else if (state is GetPostsSuccess) {
              return ListView.builder(
                itemBuilder: (context, index) => ItemPost(model: state.list[index]),
                itemCount: state.list.length);
            } else {
              return Center(
                child: Text("Something wrong"),
              );
            }
          },
        ),
      ),
    );
  }
}
