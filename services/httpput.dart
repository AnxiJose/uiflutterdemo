import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> putRequest(
    String arguments, int id, String email, String password) async {
  final url = Uri.http('localhost:8090', '$arguments/$id');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'id': id, 'email': email, 'password': password});
  final response = await http.put(url, headers: headers, body: body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
