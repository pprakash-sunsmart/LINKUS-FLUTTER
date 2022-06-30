// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:linkus/screens/chatscreen%20Files/individualChat.dart';

class ChatList extends StatefulWidget {
  final profIcon;
  final msgText;
  final contactName;
  final ntfctnCnt;
  final msgdte$tme;
  final ItmCnt;
  const ChatList({
    Key? key,
    required this.profIcon,
    required this.msgText,
    required this.contactName,
    required this.ntfctnCnt,
    required this.msgdte$tme,
    required this.ItmCnt,
  }) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: widget.ItmCnt,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewChat()));
                  },
                  leading: CircleAvatar(
                    // radius: 25,
                    child: widget.profIcon,
                  ),
                  title: widget.contactName,
                  subtitle: widget.msgText,
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      widget.ntfctnCnt,
                      SizedBox(
                        height: 5,
                      ),
                      widget.msgdte$tme
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider()),
    );
  }
}

class ChatInputBox extends StatefulWidget {
  const ChatInputBox({super.key});

  @override
  State<ChatInputBox> createState() => _ChatInputBoxState();
}

class _ChatInputBoxState extends State<ChatInputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Color.fromRGBO(1, 123, 255, 1),
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Flexible(
                    child: TextFormField(
                      cursorHeight: 16,
                      cursorColor: Colors.grey.shade900,
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          hintText: 'Type a message',
                          prefixIcon: IconButton(
                              onPressed: () {},
                              icon: Image(
                                  image:
                                      AssetImage('assets/images/smiley.png'))),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(1, 123, 255, 1),
                                  borderRadius: BorderRadius.circular(20)),
                              // child: Image(
                              //   image:
                              //       AssetImage('assets/images/attachments.png'),

                              // ),
                              child: Icon(
                                Icons.attachment,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            // iconSize: 25,
                          )),
                    ),
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: GestureDetector(
                onLongPress: () {},
                child: Image(
                  image: AssetImage('assets/images/mic.png'),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
