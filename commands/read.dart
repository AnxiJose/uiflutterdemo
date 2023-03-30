import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReadData {
  static Future<List<dynamic>> getJson() async {
    final response = await http.get(Uri.http('localhost:8090', '/products'));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static List<DataRow> getRowsFromJson(
      BuildContext context, List<dynamic> json) {
    List<DataRow> rows = [];
    for (var item in json) {
      rows.add(
        DataRow(
          cells: [
            DataCell(Text(item['id'].toString())),
            DataCell(Text(item['email'].toString())),
            DataCell(Text(item['password'].toString())),
            DataCell(ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/', arguments: item['id']);
              },
              child: const Text('edit row'),
            )),
          ],
        ),
      );
    }
    return rows;
  }
}
