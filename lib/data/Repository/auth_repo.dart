import 'package:dio/dio.dart';
import '../Models/user_info.dart';
import '../Services/http_services.dart';

class AuthRepo {
  Future<Response> getOtpCode(String phoneNumber) async {
    final Response response = await ApiRequest().doPostRequest(path: '/user/login/$phoneNumber');
    return response;
  }

  Future<UserInfoModel> confirmOtpCode({required String phoneNumber, required String otpCode}) async {
    final Response response = await ApiRequest().doGetRequest(path: '/user/verify/$phoneNumber/$otpCode');
    return UserInfoModel.fromJson(response.data);
  }
}
