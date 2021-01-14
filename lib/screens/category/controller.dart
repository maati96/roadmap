import 'package:roadmap/models/sub_category_model.dart';
import 'package:roadmap/webservices/network_gate.dart';
import 'package:shared_preferences/shared_preferences.dart';

ServerGate _serverGate = ServerGate();

class CategoriesController {
  Future<CustomResponse> getData() async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String token = _shared.getString("token");
    print(">>>>>>>>>>>>>>>>>> token is $token");

    CustomResponse response = await _serverGate.getData(
      url: 'roadmap/categories',
      headers: {
        'Content-Type': 'application/json',
        "Authorization": token,
      },
    );
    return response;
  }

  Future<List<SubCateogryModel>> fromSubCategory(int id) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String token = _shared.getString("token");
    CustomResponse response =
        await _serverGate.getData(url: 'roadmap/categories/$id', headers: {
      'Content-Type': 'application/json',
      "Authorization": token,
    });

    return response.response.data;
  }
}
