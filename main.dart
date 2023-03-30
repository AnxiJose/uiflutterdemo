import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/productsui.dart';

void main() {
  runApp(
    MaterialApp(initialRoute: '/', routes: {
      '/': (BuildContext context) => const MyHomePage(
            title: 'Demo',
          ),
      '/products': (BuildContext context) => const MyProductsPage(
            title: 'Demo',
          ),
    }),
  );
}
