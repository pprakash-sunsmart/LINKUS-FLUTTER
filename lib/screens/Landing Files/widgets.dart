// ignore_for_file: import_of_legacy_library_into_null_safe, unused_field

import 'dart:convert';
import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:linkus/screens/chatscreen%20Files/dataList.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../variables/Api_Control.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart';

import 'package:localstorage/localstorage.dart';

class ChatList extends StatefulWidget {
  dynamic chtcntLen;
  dynamic profIcon;
  dynamic msgText;
  dynamic contactName;
  dynamic ntfctnCnt;
  dynamic msgdte$tme;
  dynamic ItmCnt;
  dynamic onTap;

  ChatList(
      {Key? key,
      this.profIcon,
      this.msgText,
      this.contactName,
      this.ntfctnCnt,
      this.msgdte$tme,
      this.ItmCnt,
      this.onTap,
      this.chtcntLen})
      : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

final TextEditingController chatController = TextEditingController();

class _ChatListState extends State<ChatList> {
  @override
  void initState() {
    LoadData();
    super.initState();
  }

  var mobileNumber;
  var usernames = [];
  var profilePics = [];
  var username_length;
  LoadData() async {
    final LocalStorage storage = LocalStorage('localstorage_app');

    mobileNumber = storage.getItem('mobileNumber');

    Response response = await post(Uri.parse(RecentChats_Api), body: {
      'myid': mobileNumber.toString(),
    }, headers: {
      "Content-type": "application/x-www-form-urlencoded",
      "Accept": "application/json",
      "charset": "utf-8"
    });
    print(response.body);
    var d1 = jsonDecode(response.body);
    var Data = d1;
    print(Data);
    print(Data.length);
    // var ;
    if (Data != null || Data != []) {
      for (var i = 0; i < Data.length; i++) {
        usernames.add(Data[i]['username']);
        profilePics.add(Data[i]['buddyimage']);
      }
    }
    print('--------->${usernames}');
    setState(() {
      username_length = usernames.length;
      print('--------->${username_length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: FutureBuilder(
        // future: Future.delayed(Duration(seconds: 5)),
        builder: ((context, snapshot) {
      return ListView.separated(
          shrinkWrap: true,
          itemCount: username_length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  onTap: widget.onTap,
                  leading: CircleAvatar(
                    radius: 25,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: profilePics[index],
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, url, error) => Icon(
                          Icons.person,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                  title: Text(usernames[index]),
                  subtitle: Text('data'),
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
              const Divider());
    })));
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
            //have changed something new
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

class allContactsList extends StatefulWidget {
  final profIcon;
  final msgText;
  final contactName;
  final ntfctnCnt;
  final msgdte$tme;
  final ItmCnt;
  final onTap;

  const allContactsList(
      {required this.profIcon,
      required this.msgText,
      required this.contactName,
      required this.ntfctnCnt,
      required this.msgdte$tme,
      required this.ItmCnt,
      required this.onTap,
      super.key});

  @override
  State<allContactsList> createState() => _allContactsListState();
}

class _allContactsListState extends State<allContactsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                  onTap: widget.onTap,
                  leading: CircleAvatar(
                      // radius: 25,
                      backgroundColor: Colors.grey.withOpacity(0.1),
                      backgroundImage:
                          NetworkImage(listItems[index].photourl ?? "")),
                  title: Text(listItems[index].Name),
                  subtitle: Text(listItems[index].jobProfile),
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
