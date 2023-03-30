import 'package:flutter/material.dart';
import '../commands/read.dart';

class MyTable extends StatefulWidget {
  const MyTable({Key? key})
      : super(
            key:
                key); /*
  The issue in your code is with the declaration of your const MyTable constructor. 
  Instead of super.key, it should be Key? key as super refers to the superclass of MyTable which does not have a key property. 
  Also, it is recommended to pass key to the superclass constructor using the super keyword.
 */
  @override
  State<MyTable> createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  Future<List<dynamic>>? _data;

  @override
  void initState() {
    super.initState();
    _data = ReadData.getJson();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _data,
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  'ID',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Email',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Password',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              DataColumn(
                label: Text(
                  'Edit',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ],
            rows: ReadData.getRowsFromJson(context, snapshot.data!),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
