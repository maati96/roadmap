import 'package:roadmap/webservices/network_gate.dart';
import 'package:shared_preferences/shared_preferences.dart';

ServerGate _serverGate = ServerGate();

class ContactUsController {

  Future<CustomResponse> postData({String message, String sender}) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String token = _shared.getString("token");

    CustomResponse response = await _serverGate.postData(
      url: 'settings/api/contact',
      headers: {
      'Accept': '*/*',
        "Authorization": token,
      },
      body: {
        "sender" : sender,
        "message": message,
      },
    );
    return response;
  }
}
