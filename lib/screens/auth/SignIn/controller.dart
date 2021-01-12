import 'package:roadmap/utilities/Shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../webservices/network_gate.dart';
import 'model.dart';

AuthModel _model = AuthModel();
ServerGate serverGate = ServerGate();

class SignInController {
  Future<CustomResponse> userSignIn({
    String name,
    String password,
  }) async {
//    SharedPreferences _pref = await SharedPreferences.getInstance();
    CustomResponse response = await serverGate.postData(
      url: 'rest-auth/login/',
      body: {
        "username": name,
        "password": password,
//        "fcm_token": _pref.getString("msgToken"),
      },
      headers: {
        'Accept': '*/*',
//        'Accept-Encoding': 'gzip, deflate, br',
//        'Content-Type': 'application/json',
      },
    );

    if (response.success) {
      _model = AuthModel.fromJson(response.response.data);
      Prefs.setBool("isAuth", true);
      Prefs.setString("token", "Token " + _model.key);
    }

    return response;
  }
}
