import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  CheckPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  void initState() {
    super.initState();
    CheckPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
            const CircularProgressIndicator(),
            Text(
              "Made By Flutter",
              style: TextStyle(
                  color: Colors.pink.shade900,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.pink.shade200,
    );
  }
}
