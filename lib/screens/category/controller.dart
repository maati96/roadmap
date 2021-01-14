import 'package:roadmap/models/sub_category_model.dart';
import 'package:roadmap/webservices/network_gate.dart';
import 'package:shared_preferences/shared_preferences.dart';

ServerGate _serverGate = ServerGate();

class CategoriesController {
  Future<CustomResponse> getData(String slug) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String token = _shared.getString("token");

    CustomResponse response = await _serverGate.getData(
      url: 'roadmap/categories/$slug',
      headers: {
        'Content-Type': 'application/json',
        "Authorization": token,
      },
    );
    return response;
  }

  
}
