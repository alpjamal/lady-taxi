import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_taxi/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool _isDark = false;

  bool get isDark => _isDark;

  getTheme(bool value) => _isDark = value;

  void changeTheme() async {
    // changes app theme
    _isDark = !_isDark;
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(LtPrefs.isThemeDark, _isDark);
    emit(ThemeChanged());
  }
}
