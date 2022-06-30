// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'contactTab.dart';
import 'groupTab.dart';
import 'recentTab.dart';

class landingPage extends StatefulWidget {
  const landingPage({super.key});

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  bool profImg = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color.fromRGBO(1, 123, 255, 1),
                  leading: Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: profImg
                            ? Icon(
                                Icons.person,
                              )
                            : Icon(Icons.abc)),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'User 1',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Junior Developer',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                    // SizedBox(
                    //   width: 0,
                    // )
                  ],
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                          icon: Text(
                        'Recent',
                        style: TextStyle(fontSize: 18),
                      )),
                      Tab(
                          icon: Text(
                        'Contacs',
                        style: TextStyle(fontSize: 18),
                      )),
                      Tab(
                          icon: Text(
                        'Groups',
                        style: TextStyle(fontSize: 18),
                      )),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: const [
                    Tab(icon: recentTab()),
                    Tab(icon: contactsTab()),
                    Tab(icon: groupTab()),
                  ],
                ),
              ),
            )));
  }
}
