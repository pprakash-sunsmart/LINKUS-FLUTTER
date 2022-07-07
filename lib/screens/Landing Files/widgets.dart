// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_print, camel_case_types

import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:linkus/screens/chatscreen%20Files/dataList.dart';

class ChatList extends StatefulWidget {
  final profIcon;
  final msgText;
  final contactName;
  final ntfctnCnt;
  final msgdte$tme;
  final ItmCnt;
  final onTap;
  const ChatList({
    Key? key,
    required this.profIcon,
    required this.msgText,
    required this.contactName,
    required this.ntfctnCnt,
    required this.msgdte$tme,
    required this.ItmCnt,
    required this.onTap,
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
          itemCount: Employees.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  onTap: widget.onTap,
                  leading: CircleAvatar(
                    // radius: 25,
                    child: widget.profIcon,
                  ),
                  title: Text(Employees[index].Name),
                  subtitle: Text(Employees[index].jobProfile),
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
  dynamic controller;
  ChatInputBox({super.key, required this.controller});

  @override
  State<ChatInputBox> createState() => _ChatInputBoxState();
}

class _ChatInputBoxState extends State<ChatInputBox> {
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool SndIcon = false;

  bool emojiShowing = false;
  final TextEditingController _controller = TextEditingController();

  _onEmojiSelected(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: globalFormKey,
        child: Container(
            height: 60,
            color: Color.fromRGBO(1, 123, 255, 1),
            child: Padding(
                padding: const EdgeInsets.all(9),
                child: Row(children: [
                  Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                  cursorHeight: 16,
                                  controller: widget.controller,
                                  cursorColor: Colors.grey.shade900,
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      hintText: 'Type a message',
                                      prefixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              emojiShowing = !emojiShowing;
                                            });
                                          },
                                          icon: Image(
                                              image: AssetImage(
                                                  'assets/images/smiley.png'))),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          print('dsa');
                                        },
                                        icon: InkWell(
                                          onTap: () {},
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/attachments.png'),
                                            height: 50,
                                          ),
                                        ),
                                      )))),
                          Offstage(
                            offstage: !emojiShowing,
                            //changed
                            child: SizedBox(
                              height: 250,
                              child: EmojiPicker(
                                  onEmojiSelected:
                                      (Category category, Emoji emoji) {
                                    _onEmojiSelected(emoji);
                                  },
                                  onBackspacePressed: _onBackspacePressed,
                                  config: Config(
                                      columns: 7,
                                      emojiSizeMax:
                                          32 * (Platform.isIOS ? 1.30 : 1.0),
                                      verticalSpacing: 0,
                                      horizontalSpacing: 0,
                                      gridPadding: EdgeInsets.zero,
                                      initCategory: Category.RECENT,
                                      bgColor: const Color(0xFFF2F2F2),
                                      indicatorColor: Colors.blue,
                                      iconColor: Colors.grey,
                                      iconColorSelected: Colors.blue,
                                      progressIndicatorColor: Colors.blue,
                                      backspaceColor: Colors.blue,
                                      skinToneDialogBgColor: Colors.white,
                                      skinToneIndicatorColor: Colors.grey,
                                      enableSkinTones: true,
                                      showRecentsTab: true,
                                      recentsLimit: 28,
                                      replaceEmojiOnLimitExceed: false,
                                      noRecents: const Text(
                                        'No Recents',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black26),
                                        textAlign: TextAlign.center,
                                      ),
                                      tabIndicatorAnimDuration:
                                          kTabScrollDuration,
                                      categoryIcons: const CategoryIcons(),
                                      buttonMode: ButtonMode.MATERIAL)),
                            ),
                          ),
                        ],
                      )), // iconSize: 25,

                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                      onLongPress: () {},
                      child: SndIcon
                          ? Image(
                              image: AssetImage('assets/images/mic.png'),
                            )
                          : Icon(Icons.send),
                    ),
                  )
                ]))));
  }
}

class Mainmenu extends StatefulWidget {
  final int value;
  final double height;
  final text;
  final onTap;
  final Icon;

  const Mainmenu(
      {super.key,
      required this.value,
      required this.height,
      required this.text,
      required this.onTap,
      required this.Icon});

  @override
  State<Mainmenu> createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.Icon,
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: widget.onTap,
            child: Container(
              height: 30,
              width: 100,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class footer extends StatelessWidget {
  const footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(1, 123, 255, 1),
        height: 20,
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Center(
                    child: Text(
                      '\u00a9 Copyright Ecnchat.io',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Center(
                      child: Text(
                    'Enchat',
                    style: TextStyle(color: Colors.white),
                  )),
                ],
              ),
            )));
  }
}
