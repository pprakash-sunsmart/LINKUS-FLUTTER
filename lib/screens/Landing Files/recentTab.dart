// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, file_names, unnecessary_null_comparison
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:linkus/screens/Landing%20Files/LandingScreen.dart';
import 'package:localstorage/localstorage.dart';
import '../../variables/Api_Control.dart';
import '../chatscreen Files/individualChat.dart';
import 'widgets.dart';

class recentTab extends StatefulWidget {
  const recentTab({super.key});

  @override
  State<recentTab> createState() => _recentTabState();
}

class _recentTabState extends State<recentTab> {
  @override
  Widget build(BuildContext context) {
    // int index = 0;
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Card(
            elevation: 5,
            child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    label: Text('Search'),
                    contentPadding: EdgeInsets.symmetric())),
          ),
        ),
        ChatList(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PersonalChat()));
          },
          ntfctnCnt: CircleAvatar(
              radius: 10,
              child: Text(
                '7',
                style: TextStyle(fontSize: 10),
              )),
          chtcntLen: 12,
          msgdte$tme: Text('12/07/22'),
          contactName: Text('data'),
          msgText: Text('Hey broo'),
          profIcon: Icon(Icons.person),
          ItmCnt: 30,
        ),
      ],
    );
  }
}
