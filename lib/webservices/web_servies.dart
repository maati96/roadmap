

import 'package:roadmap/utilities/auth/auth.dart';
import 'package:roadmap/webservices/resources.dart';
import 'package:http/http.dart' as http;

class WebService {
  Future load(Resource resource) async {
    String token = await Auth().getToken();
    final response = await http.get(
        'https://roadmap-django-api.herokuapp.com/roadmap/${resource.url}',
        headers: {
          'Content-Type': 'application/json',
          'Accept': '*/*',
          'Authorization': 'Token $token'
        });
    print(response.body);
    print(token);
    return resource.parse(response);
  }

}
