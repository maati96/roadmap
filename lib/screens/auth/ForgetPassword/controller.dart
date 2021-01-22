import 'package:roadmap/screens/auth/SignIn/model.dart';
import 'package:roadmap/utilities/Shared.dart';
import '../../../webservices/network_gate.dart';

AuthModel _model = AuthModel();
ServerGate serverGate = ServerGate();

class ForgetPasswordController {
  Future<CustomResponse> forgetPassword({
    String email,
  }) async {
//    SharedPreferences _pref = await SharedPreferences.getInstance();
    CustomResponse response =
        await serverGate.postData(url:'rest-auth/password/reset/', body: {
      "email": email,
    }, headers: {
      'Accept': '*/*',
    });

    if (response.success) {
      _model = AuthModel.fromJson(response.response.data);
      Prefs.setBool("isAuth", true);
      Prefs.setString("token", "Token " + _model.key);
    }

    return response;
  }
}
