import 'package:flutter/material.dart';

import '../components/widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title; //What is final and why it should be used?
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final int? id = ModalRoute.of(context)?.settings.arguments as int?;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.title), //const MyHomePage({super.key, required this.title});
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              WidgetForm(
                idedit: (id == null) ? 0 : id,
                logged: (id == null) ? true : false,
              )
            ]),
      ),
    );
  }
}
