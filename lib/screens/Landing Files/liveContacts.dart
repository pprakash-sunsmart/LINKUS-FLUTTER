import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:linkus/screens/Landing%20Files/widgets.dart';

import '../../variables/Api_Control.dart';
import '../chatscreen Files/dataList.dart';
import '../chatscreen Files/individualChat.dart';
import 'package:http/http.dart' as http;

class liveContacts extends StatefulWidget {
  final profIcon;
  final msgText;
  final contactName;
  final ntfctnCnt;
  final msgdte$tme;
  final ItmCnt;
  final onTap;
  const liveContacts({
    Key? key,
    this.profIcon,
    this.msgText,
    this.contactName,
    this.ntfctnCnt,
    this.msgdte$tme,
    this.ItmCnt,
    this.onTap,
  }) : super(key: key);

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
        Expanded(
            //flex: 1,
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: liveItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonalChat()));
                      },
                      leading: CircleAvatar(
                        // radius: 25,
                        backgroundColor: Colors.grey.withOpacity(0.1),
                        backgroundImage:
                            NetworkImage(liveItems[index].photourl ?? ''),
                      ),
                      title: Text(liveItems[index].Name),
                      subtitle: Text(liveItems[index].jobProfile),
                      trailing: Column(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.green),
                          ),
                        ],
                      ),
                    )
                  ]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider()))
      ].toList(),
    );
  }
}
