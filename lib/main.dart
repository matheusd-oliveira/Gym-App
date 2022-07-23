import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_page.dart';
import 'package:gym_app/pages/learn_firebase.dart';
import 'package:gym_app/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym App',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
