import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
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
              "Made By Khushi bhadani",
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
