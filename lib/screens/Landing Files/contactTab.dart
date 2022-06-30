// ignore_for_file: camel_case_types, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'allcontacts.dart';
import 'liveContacts.dart';

class contactsTab extends StatefulWidget {
  const contactsTab({super.key});

  @override
  State<contactsTab> createState() => _contactsTabState();
}

class _contactsTabState extends State<contactsTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: TabBar(tabs: [
            SizedBox(
              height: 50,
              child: Center(
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'All contacts ',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '(30)',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Live Contacts ',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '(10)',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            Tab(icon: allContacts()),
            Tab(icon: liveContacts()),
          ],
        ),
      ),
    );
  }
}
