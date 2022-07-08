// // ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_print, camel_case_types

// import 'dart:io';

// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:linkus/screens/chatscreen%20Files/dataList.dart';

// class ChatList extends StatefulWidget {
//   final profIcon;
//   final msgText;
//   final contactName;
//   final ntfctnCnt;
//   final msgdte$tme;
//   final ItmCnt;
//   final onTap;

//   const ChatList({
//     Key? key,
//     required this.profIcon,
//     required this.msgText,
//     required this.contactName,
//     required this.ntfctnCnt,
//     required this.msgdte$tme,
//     required this.ItmCnt,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   State<ChatList> createState() => _ChatListState();
// }

// final TextEditingController chatController = TextEditingController();

// class _ChatListState extends State<ChatList> {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.separated(
//           shrinkWrap: true,
//           itemCount: Employees.length,
//           itemBuilder: (BuildContext context, int index) {
//             return Column(
//               children: [
//                 ListTile(
//                   onTap: widget.onTap,
//                   leading: CircleAvatar(
//                     // radius: 25,
//                     child: widget.profIcon,
//                   ),
//                   title: Text(Employees[index].Name),
//                   subtitle: Text(Employees[index].jobProfile),
//                   trailing: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       widget.ntfctnCnt,
//                       SizedBox(
//                         height: 5,
//                       ),
//                       widget.msgdte$tme
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) =>
//               const Divider()),
//     );
//   }
// }

// class ChatInputBox extends StatefulWidget {
//   dynamic controller;
//   ChatInputBox({super.key, required this.controller});

//   @override
//   State<ChatInputBox> createState() => _ChatInputBoxState();
// }

// class _ChatInputBoxState extends State<ChatInputBox> {
//   GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

//   bool MicIcon = true;

//   // var text = chatController.value.text.length;
//   onTap(text) {
//     setState(() {
//       if (chatController.text.trim() == "") {
//         MicIcon = true;
//       } else {
//         MicIcon = false;
//       }
//     });
//   }

//   bool SndIcon = false;

//   bool emojiShowing = false;
//   final TextEditingController _controller = TextEditingController();
//   // final _focusNode = FocusNode();
//   _onEmojiSelected(Emoji emoji) {
//     _controller
//       ..text += emoji.emoji
//       ..selection = TextSelection.fromPosition(
//           TextPosition(offset: _controller.text.length));
//   }

//   _onBackspacePressed() {
//     _controller
//       ..text = _controller.text.characters.skipLast(1).toString()
//       ..selection = TextSelection.fromPosition(
//           TextPosition(offset: _controller.text.length));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: globalFormKey,
//         child: Container(
//             height: 60,
//             color: Color.fromRGBO(1, 123, 255, 1),
//             child: Padding(
//                 padding: const EdgeInsets.all(9),
//                 child: Row(children: [
//                   Flexible(
//                       flex: 1,
//                       child: Column(
//                         children: [
//                           Expanded(
//                             child: Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(20)),
//                                 child: TextFormField(
//                                     // focusNode: _focusNode,
//                                     onTap: onTap(MicIcon),
//                                     onChanged: onTap,
//                                     cursorHeight: 16,
//                                     controller: widget.controller,
//                                     cursorColor: Colors.grey.shade900,
//                                     decoration: InputDecoration(
//                                         enabledBorder: InputBorder.none,
//                                         contentPadding:
//                                             EdgeInsets.symmetric(vertical: 8),
//                                         hintText: 'Type a message',
//                                         prefixIcon: IconButton(
//                                             onPressed: () {
//                                               setState(() {
//                                                 emojiShowing = !emojiShowing;
//                                                 _focusNode.unfocus();
//                                                 FocusScope.of(context)
//                                                     .requestFocus(_focusNode);
//                                               });
//                                             },
//                                             icon: Image(
//                                                 image: AssetImage(
//                                                     'assets/images/smiley.png'))),
//                                         suffixIcon: IconButton(
//                                           onPressed: () {
//                                             print('dsa');
//                                           },
//                                           icon: InkWell(
//                                             onTap: () {},
//                                             child: Image(
//                                               image: AssetImage(
//                                                   'assets/images/attachments.png'),
//                                               height: 50,
//                                             ),
//                                           ),
//                                         )))),
//                           ),
//                         ],
//                       )), // iconSize: 25,

//                   SizedBox(
//                     width: 10,
//                   ),
//                   Container(
//                       width: 40,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20)),
//                       child: GestureDetector(
//                           onLongPress: () {},
//                           child: MicIcon
//                               ? InkWell(
//                                   onTap: () {},
//                                   child: Image(
//                                     image: AssetImage('assets/images/mic.png'),
//                                   ))
//                               : Padding(
//                                   padding: const EdgeInsets.only(left: 3),
//                                   child: Icon(
//                                     Icons.send,
//                                     color: Color.fromRGBO(1, 123, 255, 1),
//                                     size: 20,
//                                   ),
//                                 )))
//                 ]))));
//   }
// }

// class Mainmenu extends StatefulWidget {
//   final int value;
//   final double height;
//   final text;
//   final onTap;
//   final Icon;

//   const Mainmenu(
//       {super.key,
//       required this.value,
//       required this.height,
//       required this.text,
//       required this.onTap,
//       required this.Icon});

//   @override
//   State<Mainmenu> createState() => _MainmenuState();
// }

// class _MainmenuState extends State<Mainmenu> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           widget.Icon,
//           SizedBox(
//             width: 10,
//           ),
//           InkWell(
//             onTap: widget.onTap,
//             child: Container(
//               height: 30,
//               width: 100,
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   widget.text,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class footer extends StatelessWidget {
//   const footer({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Color.fromRGBO(1, 123, 255, 1),
//         height: 20,
//         child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: const [
//                   Center(
//                     child: Text(
//                       '\u00a9 Copyright Ecnchat.io',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   Center(
//                       child: Text(
//                     'Enchat',
//                     style: TextStyle(color: Colors.white),
//                   )),
//                 ],
//               ),
//             )));
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_literals_to_create_immutables, avoid_print, camel_case_types, must_be_immutable, unrelated_type_equality_checks

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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

final TextEditingController chatController = TextEditingController();

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
  bool MicIcon = true;
  bool emojiShowing = false;
  bool emojiVisibility = true;
  // var text = chatController.value.text.length;
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibility.onChange.listen((bool isKeyboardVisible) {
      setState(() {
        this.isKeyboardVisible = isKeyboardVisible;
      });

      if (isKeyboardVisible && emojiShowing) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
  }

  final _focusNode = FocusNode();
  _onEmojiSelected(Emoji emoji) {
    chatController
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: chatController.text.length));
  }

  _onBackspacePressed() {
    chatController
      ..text = chatController.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: chatController.text.length));
  }

  onTap(text) {
    setState(() {
      if (chatController.text.trim() == "") {
        MicIcon = true;
      } else {
        MicIcon = false;
      }
      emojiVisibility = false;
    });
    // if (emojiShowing != true) {
    //   setState(() {
    //     emojiShowing = !emojiShowing;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalFormKey,
      child: Wrap(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height,
            // color: Colors.transparent,
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
                        child: TextFormField(
                          cursorHeight: 16,
                          controller: chatController,
                          onTap: onTap(MicIcon),
                          onChanged: onTap,
                          maxLines: 10,
                          minLines: 1,
                          keyboardType: TextInputType.multiline,
                          // autovalidateMode: AutovalidateMode.always,
                          cursorColor: Colors.grey.shade900,
                          // onTap: onTap(),
                          // onTap: onTap(),

                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 18,
                              ),
                              hintText: 'Type a message',
                              prefixIcon: Material(
                                color: Colors.transparent,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        emojiVisibility = false;
                                        emojiShowing = !emojiShowing;
                                        // if (emojiShowing) {
                                        // _focusNode.unfocus();
                                        // } else {
                                        //   FocusScope.of(context)
                                        //       .requestFocus(_focusNode);
                                        // }
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        // FocusScope.of(context)
                                        //     .requestFocus(_focusNode);
                                        // _focusNode.unfocus();
                                      });
                                      // Navigator.pop(context);
                                    },
                                    icon: Image(
                                        image: AssetImage(
                                            'assets/images/smiley.png'))),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return attatchmentsOfChatInput();
                                    },
                                  );
                                },

                                icon: Image(
                                  image: AssetImage(
                                      'assets/images/attachments.png'),
                                  height: 50,
                                ),
                                // iconSize: 25,
                              )),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: MicIcon
                          ? InkWell(
                              onTap: () {},
                              child: Image(
                                image: AssetImage('assets/images/mic.png'),
                              ))
                          : Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Icon(
                                Icons.send,
                                color: Color.fromRGBO(1, 123, 255, 1),
                                size: 20,
                              ),
                            )),
                ],
              ),
              // SizedBox(
              //   width: 5,
              // ),
            ),
          ),
          Offstage(
            offstage: !emojiShowing,
            child: SizedBox(
              height: 250.0,
              child: EmojiPicker(
                  onEmojiSelected: (Category category, Emoji emoji) {
                    _onEmojiSelected(emoji);
                  },
                  onBackspacePressed: _onBackspacePressed,
                  config: Config(
                      columns: 7,
                      emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 0.8),
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
                        style: TextStyle(fontSize: 20, color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL)),
            ),
          )
        ],
      ),
    );
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

class attatchmentsOfChatInput extends StatefulWidget {
  const attatchmentsOfChatInput({super.key});

  @override
  State<attatchmentsOfChatInput> createState() =>
      _attatchmentsOfChatInputState();
}

class _attatchmentsOfChatInputState extends State<attatchmentsOfChatInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 70),
      child: Container(
        height: 308,
        width: MediaQuery.of(context).size.width,
        child: Card(margin: EdgeInsets.all(28), child: attatchmentContents()),
      ),
    );
  }
}

class attatchmentContents extends StatefulWidget {
  const attatchmentContents({super.key});

  @override
  State<attatchmentContents> createState() => _attatchmentContentsState();
}

class _attatchmentContentsState extends State<attatchmentContents> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await FilePicker.platform.pickFiles(type: FileType.any);
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromARGB(255, 151, 64, 251),
                    child: Icon(
                      Icons.file_copy,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Document'),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {},
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.pink,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Camera'),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 25,
            ),
            InkWell(
              onTap: () async {
                await FilePicker.platform.pickFiles(type: FileType.image);
              },
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(
                      Icons.filter,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Gallery'),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.location_on),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Location'),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
