// ignore_for_file: non_constant_identifier_names, avoid_print, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:linkus/screens/Login%20Files/loginscreen.dart';
import 'package:linkus/variables/Api_Control.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Status(String status) async {
    Map data = {"compid": "1", "status": status};
    print(data);
    String body = json.encode(data);
    print(body);

    var response = await http.post(
      Uri.parse(Contacts_Api),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
    );
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      Status("online");
    } else {
      Status("offline");
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Link Us',
        home: LoginScreen());
  }
}
