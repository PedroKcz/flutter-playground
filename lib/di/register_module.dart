import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
