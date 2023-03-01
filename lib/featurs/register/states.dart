
part of 'cubit.dart';
class RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final String msg;

  RegisterSuccessState({required this.msg})
  {
    showToast(msg,type: MessageType.success);
  }
}

class RegisterFailedState extends RegisterStates {
  final String msg;

  RegisterFailedState({required this.msg}){
    showToast(msg);
  }
}
