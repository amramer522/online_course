import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/dio_helper.dart';
import '../../core/helper_methods.dart';

part 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStates());

  final dio = DioHelper();

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());

    final resp =
        await dio.postData("http://store.webautobazaar.com/api/intial/users/login", parameters: {
      "email": email,
      "password": password,
    });

    if (resp.isSuccess) {
      emit(LoginSuccessState(msg: "msg"));
    } else {
      emit(LoginFailedState(msg: resp.msg));
    }
  }
}
