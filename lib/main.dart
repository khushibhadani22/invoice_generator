import 'package:flutter/material.dart';
import 'package:womenaasecari/deatil.dart';
import 'package:womenaasecari/pdfPage.dart';
import 'package:womenaasecari/splashpage.dart';

import 'cartPage.dart';
import 'edit page.dart';
import 'first.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash',
    routes: {
      '/': (context) => const MyApp(),
      'splash': (context) => const Splash(),
      'edit': (context) => const Edit(),
      'home': (context) => const Home(),
      'details': (context) => const Details(),
      'cart': (context) => const CartPage(),
      'pdf': (context) => const PDF(),
    },
  ));
}
