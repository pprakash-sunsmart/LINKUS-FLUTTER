// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, file_names

import 'package:flutter/material.dart';

import 'widgets.dart';

class recentTab extends StatefulWidget {
  const recentTab({super.key});

  @override
  State<recentTab> createState() => _recentTabState();
}

class _recentTabState extends State<recentTab> {
  @override
  Widget build(BuildContext context) {
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
          ntfctnCnt: CircleAvatar(
              radius: 10,
              child: Text(
                '7',
                style: TextStyle(fontSize: 10),
              )),
          msgdte$tme: Text('12/07/22'),
          contactName: Text('SSG_USER_1'),
          msgText: Text('Hey broo'),
          profIcon: Icon(Icons.person),
          ItmCnt: 30,
        )
      ],
    );
  }
}
