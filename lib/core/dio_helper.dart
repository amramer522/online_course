import 'package:dio/dio.dart';

class DioHelper {
  final _dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      contentType: "multipart/form-data; boundary=<calculated when request is sent>",
    ),
  );

  Future<MyResponse> getData(String path, {Map<String, dynamic>? parameters}) async {
    print("-------- >  Parameters");
    print(parameters);
    try {
      final resp = await _dio.get(path, queryParameters: parameters);
      print("-------- >  Response Data");

      print(resp.data);
      if (resp.data["status"] == 1 || resp.data["status"]) {
        return MyResponse(isSuccess: true, msg: resp.data["msg"] ?? "Success", response: resp);
      } else {
        return MyResponse(isSuccess: false, msg: resp.data["msg"] ?? "Failed");
      }
    } on DioError catch (err) {
      return MyResponse(isSuccess: false, msg: err.response!.data["msg"] ?? "Failed");
    }
  }

  Future<MyResponse> postData(String path, {Map<String, dynamic>? parameters}) async {
    print("-------- >  Parameters");
    print(parameters);
    try {
      final resp = await _dio.post(path, data: FormData.fromMap(parameters ?? {}));
      print("-------- >  Response Data");
      print(resp.data);
      if (resp.data["status"] == 1 || resp.data["status"]) {
        return MyResponse(isSuccess: true, msg: resp.data["msg"] ?? "Success", response: resp);
      } else {
        return MyResponse(isSuccess: false, msg: resp.data["msg"] ?? "Failed");
      }
    } on DioError catch (err) {
      return MyResponse(isSuccess: false, msg: err.response!.data["msg"] ?? "Failed");
    }
  }

  MultipartFile convertImageToMultiPart(String imageUrl) {
    return MultipartFile.fromFileSync(
      imageUrl,
      filename: imageUrl
          .split("/")
          .last,
    );
  }
}

class MyResponse {
  final Response? response;
  final bool isSuccess;
  final String msg;

  MyResponse({this.response, required this.isSuccess, required this.msg});
}
