// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../Landing Files/widgets.dart';

class groupChat extends StatefulWidget {
  const groupChat({super.key});

  @override
  State<groupChat> createState() => _groupChatState();
}

class _groupChatState extends State<groupChat> {
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
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 25,
                    )),
                leadingWidth: 30,
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
                        child:
                            Text('Group Chat', style: TextStyle(fontSize: 18)))
                  ],
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
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
                                        text: 'Group Information',
                                        onTap: () {},
                                        Icon: const Icon(Icons.person)),
                                    const PopupMenuDivider()
                                  ],
                                )),
                                PopupMenuItem(
                                    child: Column(
                                  children: [
                                    Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'File Filter',
                                        onTap: () {},
                                        Icon: const Icon(Icons.file_open)),
                                    const PopupMenuDivider()
                                  ],
                                )),
                                PopupMenuItem(
                                    child: Column(
                                  children: [
                                    Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'Chat Filter',
                                        onTap: () {},
                                        Icon: const Icon(Icons.abc)),
                                    const PopupMenuDivider()
                                  ],
                                )),
                                PopupMenuItem(
                                    child: Column(
                                  children: [
                                    Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'Clear Chat',
                                        onTap: () {},
                                        Icon: const Icon(Icons.delete)),
                                    const PopupMenuDivider()
                                  ],
                                )),
                                PopupMenuItem(
                                    child: Column(
                                  children: [
                                    Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'Wall Paper',
                                        onTap: () {},
                                        Icon:
                                            const Icon(Icons.wallpaper_sharp)),
                                    const PopupMenuDivider()
                                  ],
                                )),
                              ])),
                ],
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'assets/images/chatBackground.jpg',
                        ),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    // Text('data' * 500),
                  ],
                )),
              ),
              bottomSheet: const ChatInputBox(),
            )));
  }
}
