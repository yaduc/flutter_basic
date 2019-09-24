import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/LoginResponse.dart';

String BASE_URL = "https://reqres.in";

Future<LoginResponse> doLogin(email, password) async {
  final response = await http.post('${BASE_URL}/api/login',
      body: {"email": email, "password": password});
  if (response.statusCode >= 200 && response.statusCode < 300) {
    Success success = Success.fromJson(json.decode(response.body));
    return LoginResponse(success: success);
  } else if (response.statusCode >= 400 && response.statusCode <= 500) {
    Error error = Error.fromJson(json.decode(response.body));
    return LoginResponse(error: error);
  } else {
    throw Exception();
  }
}
