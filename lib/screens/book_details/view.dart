import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../books/cubit.dart';
import '../books/model.dart';
import '../books/states.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book model;
  final BooksCubit cubit;

  const BookDetailsScreen({Key? key, required this.model, required this.cubit}) : super(key: key);

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    print("build details view");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Detail"),
        actions: [
          BlocBuilder(
              bloc: widget.cubit,
              buildWhen: (previous, current) => current is ToggleFavSuccessState,
              builder: (context, state) {
                print("build just icon");
                return IconButton(
                    onPressed: () {
                      widget.model.toggleFav();
                      widget.cubit.toggleFav(id: widget.model.id);
                    },
                    icon: Icon(
                      widget.model.isFav ? Icons.favorite : Icons.favorite_border,
                      color: widget.model.isFav ? Colors.red : Colors.grey,
                    ));
              })
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.network(
              widget.model.image,
              height: 300,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(widget.model.title),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(widget.model.description),
            )
          ],
        ),
      ),
    );
  }
}
