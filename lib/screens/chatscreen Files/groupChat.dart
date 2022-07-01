import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                  icon: const Icon(Icons.arrow_back),
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
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert)),
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
                  children: const [
                    // Text('data' * 50000),
                  ],
                )),
              ),
              bottomSheet: const ChatInputBox(),
            )));
  }
}
