import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/screens/cars/states.dart';

import 'model.dart';

class CarsCubit extends Cubit<CarsStates> {
  CarsCubit() : super(GetCarsInitialState());

  List<Car> cars = [];

  void getCars({bool isSuccess = false}) async {
    emit(GetCarsLoadingState());
    await Future.delayed(Duration(seconds: 3));
    cars = [
      Car(
          id: 0,
          color: "Yellow",
          name: "Fiat",
          image:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/1970_Fiat_500_L_--_2011_DC_1.jpg/1200px-1970_Fiat_500_L_--_2011_DC_1.jpg"),
      Car(
          id: 1,
          color: "White",
          name: "Audi",
          image:
              "https://cdn.autoportal.com/img/new-cars-gallery/audi/a4/colors/98c79451b128364d9e1ee245280e4b1c.jpg"),
      Car(
          id: 1,
          color: "Blue",
          name: "Hundai",
          image:
              "https://media.hatla2eestatic.com/uploads/ncarmodel/8486/big-up_fa306c832df6efe9d352637e960c5139.jpg"),
    ];

    if (isSuccess) {
      emit(GetCarsSuccessState());
    } else {
      emit(GetCarsFailedState());
    }
  }
}
