// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, dead_code, unrelated_type_equality_checks, unused_local_variable, avoid_print, avoid_unnecessary_containers

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:linkus/screens/Landing%20Files/widgets.dart';
import 'package:linkus/screens/filters/mediaFilter.dart';
import 'package:linkus/screens/filters/searchFilter.dart';

import '../profile/my_profile.dart';

class PersonalChat extends StatefulWidget {
  const PersonalChat({super.key});

  @override
  State<PersonalChat> createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChat> {
  Future _pickFile() async {
    final result =

        // await FilePicker.platform.pickFiles(allowMultiple: false);
        await FilePicker.platform.pickFiles(type: FileType.any);
  }

  final TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isTextfield = false;
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
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                    )),
                leadingWidth: 30,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    isTextfield
                        ? Text('data', style: TextStyle(fontSize: 18))
                        : Text('xyz')
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
                                    height: 10,
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                            value: 1,
                                            height: 0,
                                            text: 'Profile',
                                            onTap: () {
                                              // Navigator.pop(context);
                                              Navigator.pushAndRemoveUntil<
                                                  dynamic>(
                                                context,
                                                MaterialPageRoute<dynamic>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          ProfilePage(),
                                                ),
                                                (route) => true,
                                                //if you want to disable back feature set to false
                                              );
                                            },
                                            Icon: const Icon(Icons.person)),
                                        PopupMenuDivider()
                                      ],
                                    )),
                                PopupMenuItem(
                                    height: 30,
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                            value: 2,
                                            height: 0,
                                            text: 'Search',
                                            onTap: () {
                                              // debugger();

                                              isTextfield = true;
                                              Navigator.pop(
                                                  context, isTextfield = true);
                                              print(isTextfield);

                                              // setState(() {
                                              //   isTextfield = 2;
                                              //   // print(isTextfield);
                                              // });

                                              // print("name:$isTextfield");
                                              // Navigator.pop(context);
                                            },
                                            Icon: const Icon(Icons.search)),
                                        PopupMenuDivider()
                                      ],
                                    )),
                                PopupMenuItem(
                                    child: Column(
                                  children: [
                                    Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'File Filter',
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.pushAndRemoveUntil<dynamic>(
                                            context,
                                            MaterialPageRoute<dynamic>(
                                              builder: (BuildContext context) =>
                                                  FileFilter(),
                                            ),
                                            (route) => true,
                                            //if you want to disable back feature set to false
                                          );
                                        },
                                        Icon: const Icon(Icons.file_open)),
                                    PopupMenuDivider()
                                  ],
                                )),
                                PopupMenuItem(
                                    child: Column(
                                  children: [
                                    Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'Chat Filter',
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.pushAndRemoveUntil<dynamic>(
                                            context,
                                            MaterialPageRoute<dynamic>(
                                              builder: (BuildContext context) =>
                                                  SearchFilter(),
                                            ),
                                            (route) => true,
                                            //if you want to disable back feature set to false
                                          );
                                        },
                                        Icon: const Icon(Icons.chat)),
                                    PopupMenuDivider()
                                  ],
                                )),
                                PopupMenuItem(
                                    child: Column(
                                  children: [
                                    Mainmenu(
                                        value: 2,
                                        height: 0,
                                        text: 'Block',
                                        onTap: () {
                                          Navigator.pop(context);
                                          showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return WillPopScope(
                                                  onWillPop: () async => false,
                                                  child: AlertDialog(
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 250, 241, 161),
                                                    content: Text(
                                                      'Do you want to block this contact?',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15),
                                                    ),
                                                    title: const Text(
                                                      'Confirm !',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 35),
                                                    ),
                                                    actions: <Widget>[
                                                      ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            shadowColor:
                                                                Colors.grey,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12))),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text('No'),
                                                      ),
                                                      ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            shadowColor:
                                                                Colors.grey,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12))),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child:
                                                            const Text('Yes'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              });
                                        },
                                        Icon: const Icon(Icons.lock)),
                                    PopupMenuDivider()
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
                                    PopupMenuDivider()
                                  ],
                                )),
                                PopupMenuItem(
                                    child: Column(children: [
                                  Mainmenu(
                                      value: 2,
                                      height: 0,
                                      text: 'Wall Paper',
                                      onTap: () {
                                        Navigator.pop(context);
                                        showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                child: WillPopScope(
                                                  onWillPop: () async => false,
                                                  child: AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      backgroundColor:
                                                          Colors.white,
                                                      // content: const Text(''),
                                                      actions: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 70,
                                                                  bottom: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              // ElevatedButton(
                                                              //   style: ElevatedButton.styleFrom(
                                                              //       shadowColor:
                                                              //           Colors
                                                              //               .grey,
                                                              //       shape: RoundedRectangleBorder(
                                                              //           borderRadius:
                                                              //               BorderRadius.circular(12))),
                                                              //   onPressed: () {
                                                              //     _pickFile();
                                                              //   },
                                                              //   child: const Text(
                                                              //       'Gallery'),
                                                              // ),

                                                              InkWell(
                                                                onTap: () {
                                                                  _pickFile();
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .grey,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  width: 80,
                                                                  height: 40,
                                                                  child:
                                                                      const Center(
                                                                    child: Text(
                                                                      'Gallery',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 20,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .grey,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  width: 80,
                                                                  height: 40,
                                                                  child:
                                                                      const Center(
                                                                    child: Text(
                                                                      'Default',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                              );
                                            });
                                      },
                                      Icon: const Icon(Icons.wallpaper_sharp)),
                                  const PopupMenuDivider()
                                ]))
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
              bottomSheet: ChatInputBox(
                controller: chatController,
              ),
            )));
  }
}
