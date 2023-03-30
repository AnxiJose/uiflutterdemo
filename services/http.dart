
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> postRequest(
    String arguments, String email, String password) async {
  final url = Uri.http('localhost:8090', arguments); // why final and not var
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'id': null, 'email': email, 'password': password});
  final response = await http.post(url, headers: headers, body: body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
