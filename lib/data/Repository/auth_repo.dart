import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/user_info.dart';

import '../Services/http_services.dart';
import '/utils/constants.dart';

class AuthRepo {
  Future<Response> getOtpCode(String phoneNumber) async {
    try {
      final Response response = await ApiRequest().doPostRequest(path: '/user/login/$phoneNumber');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future confirmOtpCode({required String phoneNumber, required String otpCode}) async {
    final Response response = await ApiRequest().doGetRequest(path: '/user/verify/$phoneNumber/$otpCode');
    return UserInfoModel.fromJson(response.data);
  }

  Future<String> createProfile() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String userName = prefs.getString(LtPrefs.name)!;
      String userGender = prefs.getString(LtPrefs.gender)!;
      String accessToken = prefs.getString(LtPrefs.accessToken)!;

      final Response response = await ApiRequest().doPostRequest(
        path: '/user/register',
        headers: {'Authorization': accessToken},
        body: {"full_name": userName, "gender": userGender},
      );
      return UserInfoModel.fromJson(response.data).accessToken!;
    } catch (error) {
      rethrow;
    }
  }
}
