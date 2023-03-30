import 'package:flutter/material.dart';

import '../components/datarow.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key, required this.title});
  final String title; //What is final and why it should be used?

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: MyTable(),
            ),
          ],
        ),
      ),
    );
  }
}
