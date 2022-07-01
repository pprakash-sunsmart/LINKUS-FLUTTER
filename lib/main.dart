// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:linkus/screens/Login%20Files/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Link Us',
      home: LoginScreen(),
    );
  }
}
