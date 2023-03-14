import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/user_info.dart';

import '../Services/http_services.dart';
import '/utils/constants.dart';

class AuthRepo {
  Future<Response> getOtpCode(String phoneNumber) async {
    // Sends phone number to the server and gets verification code to the device
    try {
      final Response response = await ApiRequest().doPostRequest(path: '/user/login/$phoneNumber');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future confirmOtpCode({required String phoneNumber, required String otpCode}) async {
    // Sends phone number and verification code to the server, and confirms
    final Response response = await ApiRequest().doGetRequest(path: '/user/verify/$phoneNumber/$otpCode');

    var prefs = await SharedPreferences.getInstance();
    String accessToken = UserInfoModel.fromJson(response.data).accessToken!;
    prefs.setString(LtPrefs.accessToken, accessToken);

    return UserInfoModel.fromJson(response.data);
  }

  Future<String> createProfile() async {
    // Creates new profile
    try {
      var prefs = await SharedPreferences.getInstance();
      String userName = prefs.getString(LtPrefs.name)!;
      String userGender = prefs.getString(LtPrefs.gender) ?? 'ayol';
      String accessToken = prefs.getString(LtPrefs.accessToken)!;
      if (userName.isEmpty) throw Exception();

      final Response response = await ApiRequest().doPostRequest(
        path: '/user/register',
        headers: {'Authorization': accessToken},
        body: {"full_name": userName, "gender": userGender},
      );

      accessToken = UserInfoModel.fromJson(response.data).accessToken!;
      prefs.setString(LtPrefs.accessToken, accessToken);
      prefs.setBool(LtPrefs.isOpened, false);
      return UserInfoModel.fromJson(response.data).accessToken!;
    } catch (error) {
      rethrow;
    }
  }

  Future<void> logOut() async {
    // Cleares user data from device
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(LtPrefs.accessToken);
    prefs.remove(LtPrefs.name);
    prefs.remove(LtPrefs.gender);
  }
}
