import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:linkus/screens/Login%20Files/login_textfield.dart';
import 'package:linkus/screens/Login%20Files/loginscreen.dart';
import 'package:linkus/screens/calendar/date_time.dart';

import 'package:linkus/screens/project_milestone/project_milestone.dart';
import 'package:linkus/screens/project_milestone/project_page.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

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
        home:LoginScreen());
  }
}

