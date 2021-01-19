import 'package:roadmap/screens/auth/SignIn/model.dart';
import 'package:roadmap/utilities/Shared.dart';
import '../../../webservices/network_gate.dart';

AuthModel _model = AuthModel();
ServerGate serverGate = ServerGate();

class SignUpController {
  Future<CustomResponse> userSignUp({
    String username,
    String email,
    String password,
    String passwordConfirm,
  }) async {
//    SharedPreferences _pref = await SharedPreferences.getInstance();
    CustomResponse response = await serverGate.postData(
      url: 'rest-auth/signup',
      body: {
        "username": username,
        "email": email,
        "password1": password,
        "password2": passwordConfirm,
      },
      headers: {
        'Accept': '*/*',
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
