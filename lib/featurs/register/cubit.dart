import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/dio_helper.dart';
import '../../core/helper_methods.dart';

part 'states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterStates());

  final dio = DioHelper();

  Future<void> register(
      {required String email,
      required String password,
      required String phone,
      required String name,
      required String imageUrl}) async {
    emit(RegisterLoadingState());
    final resp =
        await dio.postData("http://store.webautobazaar.com/api/intial/users/register", parameters: {
      "email": email,
      "password": password,
      "phone": phone,
      "image": dio.convertImageToMultiPart(imageUrl),
      "name": name,
    });

    if (resp.isSuccess) {
      emit(RegisterSuccessState(msg: resp.msg));
    } else {
      emit(RegisterFailedState(msg: resp.msg));
    }
  }
}
