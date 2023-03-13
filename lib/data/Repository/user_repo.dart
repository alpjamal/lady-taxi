import 'package:dio/dio.dart';
import 'package:lady_taxi/data/Models/user_info.dart';
import 'package:lady_taxi/data/Services/http_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';

class UserRepo {
  Future<UserInfoModel?> getUserInfo() async {
    try {
      var prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString(LtPrefs.accessToken);
      if (accessToken != null) {
        final Response response = await ApiRequest().doGetRequest(
          path: '/user',
          headers: {'Authorization': accessToken},
        );
        return UserInfoModel.fromJson(response.data);
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }
}
