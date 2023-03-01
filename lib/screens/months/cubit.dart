import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class MonthsCubit extends Cubit<MonthsStates>
{
  String monthName = "";
  final numberController = TextEditingController();

  MonthsCubit() : super(MonthsInitialState());

  void getMonthName()
  {
    int num = int.parse(numberController.text);
    List<String> monthsNames = ["Jan", "Feb", "Mars", "Epril"];
    monthName = monthsNames[num - 1];
    emit(MonthsNameChangedState());
  }

}