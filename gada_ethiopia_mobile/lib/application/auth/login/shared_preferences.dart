import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future createCatch(String email) async {
    SharedPreferences _preference = await SharedPreferences.getInstance();
    _preference.setString("email", email);
  }

 Future<String?> getCatch() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("email");
  }

   Future removeCatch(String email) async {
    SharedPreferences _preference = await SharedPreferences.getInstance();
    _preference.remove("email");
  }
}
