import 'package:roadmap/webservices/network_gate.dart';
import 'package:shared_preferences/shared_preferences.dart';

ServerGate _serverGate = ServerGate();

class HomeController {
  Future<CustomResponse> getData() async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String token = _shared.getString("token");
    CustomResponse response = await _serverGate.getData(
      url: 'settings/api/home',
      headers: {
        'Content-Type': 'application/json',
        "Authorization": token,
      },
    );
    return response;
  }
}
