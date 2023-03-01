import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/cache_helper.dart';
import 'states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  int count = CacheHelper.getCounter();

  CounterCubit() : super(CounterInitialState());

  void plus(){
    count++;
    CacheHelper.saveCounter(count);
    emit(CounterPlusState());
  }

  void minus(){
    count--;
    CacheHelper.saveCounter(count);
    emit(CounterMinusState());
  }


}