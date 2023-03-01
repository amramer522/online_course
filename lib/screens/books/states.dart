import 'model.dart';

class BooksStates {}

class BooksLoadingState extends BooksStates {}

class BooksSuccessState extends BooksStates {
  List<Book> list;

  BooksSuccessState({required this.list});
}

class BooksFailedState extends BooksStates {
  final String message;

  BooksFailedState({required this.message});
}





class ToggleFavLoadingState extends BooksStates {}

class ToggleFavSuccessState extends BooksStates {
  final int id;

  ToggleFavSuccessState({required this.id});
}

class ToggleFavFailedState extends BooksStates {
  final String message;

  ToggleFavFailedState({required this.message});
}
