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
                        child: Text('individual chat',
                            style: TextStyle(fontSize: 18)))
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.video_call)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
                  Theme(
                      data: Theme.of(context).copyWith(
                        dividerTheme: const DividerThemeData(
                            color: Colors.black, thickness: 0.5),
                        iconTheme: const IconThemeData(color: Colors.white),
                      ),
                      child: PopupMenuButton(
                          color: const Color.fromRGBO(1, 123, 255, 1),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                    child: Column(
                                  children: [
                                    Mainmenu(
                                        value: 1,
                                        height: 0,
                                        text: 'Profile',
                                        onTap: () {},
                                        Icon: const Icon(Icons.person)),
                                    PopupMenuDivider()
                                  ],
                                )),
                                PopupMenuItem(
                                    child: Column(
                                  children: [
                                    Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'Search',
                                        onTap: () {},
                                        Icon: const Icon(Icons.search)),
                                    PopupMenuDivider()
                                  ],
                                )),
                                PopupMenuItem(
                                    child: Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'File Filter',
                                        onTap: () {},
                                        Icon: const Icon(Icons.file_open))),
                                PopupMenuItem(
                                    child: Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'Chat Filter',
                                        onTap: () {},
                                        Icon: const Icon(Icons.delete))),
                                PopupMenuItem(
                                    child: Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'Block',
                                        onTap: () {},
                                        Icon: const Icon(Icons.lock))),
                                PopupMenuItem(
                                    child: Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'Clear Chat',
                                        onTap: () {},
                                        Icon: const Icon(Icons.delete))),
                                PopupMenuItem(
                                    child: Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'Wall Paper',
                                        onTap: () {},
                                        Icon: const Icon(Icons.wallpaper))),
                              ])),
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
