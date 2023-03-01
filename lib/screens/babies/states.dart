import 'model.dart';

class BabiesStates {}

// class GetBabiesInitialState extends BabiesStates {}
class GetBabiesLoadingState extends BabiesStates {}

class GetBabiesSuccessState extends BabiesStates {
  final List<Baby> list;
  GetBabiesSuccessState({required this.list});

}

class GetBabiesFailedState extends BabiesStates {
  final String message;
  GetBabiesFailedState({required this.message});
}
