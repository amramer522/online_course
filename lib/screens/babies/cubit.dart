import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';
import 'states.dart';

class BabiesCubit extends Cubit<BabiesStates> {
  BabiesCubit() : super(BabiesStates());

  void printData() {
    print("Hello World");
  }

  void getBabies({bool isSuccess = false}) async {
    emit(GetBabiesLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    List<Baby> list = [
      Baby(age: 1, name: "Ahmed", imageUrl: ""),
      Baby(age: 5, name: "Ali", imageUrl: ""),
      Baby(age: 3, name: "Mohamed", imageUrl: ""),
      Baby(age: 2, name: "Wael", imageUrl: ""),
    ];
    if (isSuccess) {
      emit(GetBabiesSuccessState(list: list));
    } else {
      emit(GetBabiesFailedState(message: "Server Error"));
    }
  }
}
