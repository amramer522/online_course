import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/helper_methods.dart';
import 'package:online_course/screens/book_details/view.dart';

import 'components/item_book.dart';
import 'cubit.dart';
import 'states.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return BlocProvider(
      create: (context) => BooksCubit()..getBooks(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Books"),
          centerTitle: true,
        ),
        body: Builder(builder: (context) {
          BooksCubit cubit = BlocProvider.of(context);
          return BlocConsumer<BooksCubit, BooksStates>(
            listenWhen: (previous, current) => current is ToggleFavLoadingState,
            listener: (context, state) {
              print("Loading form listener");
            },
            buildWhen: (previous, current) =>
                current is BooksLoadingState ||
                current is BooksSuccessState ||
                current is BooksFailedState,
            builder: (context, state) {
              if (state is BooksLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is BooksFailedState) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Failed Try again"),
                      ElevatedButton(
                          onPressed: () {
                            cubit.getBooks();
                          },
                          child: const Text("Try again"))
                    ],
                  ),
                );
              } else if (state is BooksSuccessState) {
                return GridView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: state.list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 195 / 300),
                  itemBuilder: (context, index) => ItemBook(
                    model: state.list[index],
                  ),
                );
              } else {
                return const Center(
                  child: Text("Something Wrong"),
                );
              }
            },
          );
        }),
      ),
    );
  }
}
