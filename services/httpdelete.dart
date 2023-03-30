import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> deleteRequest(
    String arguments, int id, String email, String password) async {
  final url = Uri.http('localhost:8090', '$arguments/$id');
  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'id': id, 'email': email, 'password': password});
  final response = await http.delete(url, headers: headers, body: body);
  if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    return true;
  } else {
    print(body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return false;
  }
}
