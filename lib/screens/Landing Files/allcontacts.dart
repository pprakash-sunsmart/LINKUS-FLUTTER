// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import

import 'package:flutter/material.dart';
import 'package:linkus/screens/chatscreen%20Files/dataList.dart';

import '../chatscreen Files/individualChat.dart';
import 'widgets.dart';

class allContacts extends StatefulWidget {
  const allContacts({super.key});

  @override
  State<allContacts> createState() => _allContactsState();
}

class _allContactsState extends State<allContacts> {
  @override
  Widget build(BuildContext context) {
    return allContactsList(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PersonalChat()));
      },
      profIcon: Icon(Icons.person),
      msgText: null,
      msgdte$tme: Text(''),
      ntfctnCnt: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.red),
      ),
      contactName: Text(
        'Developer',
      ),
      ItmCnt: 30,
    );
  }
}
