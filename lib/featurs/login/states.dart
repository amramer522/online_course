
part of 'cubit.dart';
class LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final String msg;

  LoginSuccessState({required this.msg})
  {
    showToast(msg,type: MessageType.success);
  }
}

class LoginFailedState extends LoginStates {
  final String msg;

  LoginFailedState({required this.msg}){
    showToast(msg);
  }
}
