import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/helper_methods.dart';
import 'package:online_course/screens/books/states.dart';

import '../../book_details/view.dart';
import '../../book_details/view.dart';
import '../cubit.dart';
import '../model.dart';

class ItemBook extends StatefulWidget {
  final Book model;

  const ItemBook({Key? key, required this.model}) : super(key: key);

  @override
  State<ItemBook> createState() => _ItemBookState();
}

class _ItemBookState extends State<ItemBook> {
  @override
  Widget build(BuildContext context) {
    BooksCubit cubit = BlocProvider.of(context);
    print("build item");
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Expanded(child: Image.network(widget.model.image)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlocConsumer<BooksCubit, BooksStates>(
                      listenWhen: (previous, current) =>
                          current is ToggleFavSuccessState && current.id == widget.model.id,
                      listener: (context, state) {
                        print("listen from item");

                        if (state is ToggleFavSuccessState) {
                          navigateTo(
                              page: BookDetailsScreen(model: widget.model, cubit: cubit));
                        }
                      },
                      buildWhen: (previous, current) =>
                          current is ToggleFavSuccessState && current.id == widget.model.id,
                      builder: (context, state) {
                        print("build text");
                        return Text(
                          widget.model.title + (widget.model.isFav ? "Fav" : "NOt"),
                          style: TextStyle(color: widget.model.isFav ? Colors.red : Colors.green),
                        );
                      }),
                  BlocBuilder<BooksCubit, BooksStates>(
                      buildWhen: (previous, current) =>
                          current is ToggleFavSuccessState && current.id == widget.model.id,
                      builder: (context, state) {
                        print("build just icon");
                        return IconButton(
                            onPressed: () {
                              widget.model.toggleFav();
                              cubit.toggleFav(id: widget.model.id);
                            },
                            icon: Icon(
                              widget.model.isFav ? Icons.favorite : Icons.favorite_border,
                              color: widget.model.isFav ? Colors.red : Colors.grey,
                            ));
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
