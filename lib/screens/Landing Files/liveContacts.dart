// ignore_for_file: prefer_const_constructors, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:linkus/screens/Landing%20Files/widgets.dart';

import '../chatscreen Files/individualChat.dart';

class liveContacts extends StatefulWidget {
  const liveContacts({super.key});

  @override
  State<liveContacts> createState() => _liveContactsState();
}

class _liveContactsState extends State<liveContacts> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          profIcon: Icon(Icons.person),
          msgText: null,
          msgdte$tme: Text(''),
          ntfctnCnt: Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.green),
          ),
          contactName: Text(
            'Developer',
          ),
          ItmCnt: 10,
        )
      ],
    );
  }
}
