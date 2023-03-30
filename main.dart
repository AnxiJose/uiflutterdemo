import 'package:flutter/material.dart';
import 'package:my_first_flutter/views/productsui.dart';
import 'views/home.dart';

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
