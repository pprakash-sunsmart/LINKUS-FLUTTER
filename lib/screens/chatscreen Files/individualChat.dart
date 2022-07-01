// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:linkus/screens/Landing%20Files/widgets.dart';

class PersonalChat extends StatefulWidget {
  const PersonalChat({super.key});

  @override
  State<PersonalChat> createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                leadingWidth: 25,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text('Developer SSG - 001',
                            style: TextStyle(fontSize: 18)))
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.video_call)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert)),
                ],
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/chatBackground.jpg',
                        ),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    // Text('data' * 50000),
                  ],
                )),
              ),
              bottomSheet: ChatInputBox(),
            )));
  }
}
