import 'package:roadmap/webservices/network_gate.dart';

ServerGate _serverGate = ServerGate();

class HomeController {
  Future<CustomResponse> getData() async {
    // Map<String, dynamic> headers = await headersMapWithoutToken();
    CustomResponse response = await _serverGate.getData(
      url: 'home',
      headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Content-Type': 'application/json',
      },
    );
    return response;
  }
}
