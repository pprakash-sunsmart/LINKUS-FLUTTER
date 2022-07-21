// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_unnecessary_containers, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:linkus/screens/filters/searchFilter.dart';

import '../Landing Files/widgets.dart';
import '../filters/mediaFilter.dart';
import '../profile/groupProfile.dart';

class groupChat extends StatefulWidget {
  var GroupNames;
  var GroupImages;
  groupChat({super.key, this.GroupNames, this.GroupImages});

  @override
  State<groupChat> createState() => _groupChatState();
}

class _groupChatState extends State<groupChat> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController chatController = TextEditingController();
  Future _pickFile() async {
    final result =

        // await FilePicker.platform.pickFiles(allowMultiple: false);
        await FilePicker.platform.pickFiles(type: FileType.any);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Scaffold(
              key: _scaffoldKey,
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
                  children: [
                    CircleAvatar(
                      child: ClipOval(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.GroupImages,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.groups_rounded,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Text(widget.GroupNames,
                            style: TextStyle(fontSize: 18)))
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
                                        onTap: () {
                                          Navigator.pop(context);
                                          _scaffoldKey.currentState!
                                              .openEndDrawer();
                                          // Navigator.pushAndRemoveUntil<dynamic>(
                                          //   context,
                                          //   MaterialPageRoute<dynamic>(
                                          //     builder: (BuildContext context) =>

                                          //   ),
                                          //   (route) => true,
                                          //   //if you want to disable back feature set to false
                                          // );
                                        },
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
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.pushAndRemoveUntil<dynamic>(
                                            context,
                                            MaterialPageRoute<dynamic>(
                                              builder: (BuildContext context) =>
                                                  const FileFilter(),
                                            ),
                                            (route) => true,
                                            //if you want to disable back feature set to false
                                          );
                                        },
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
                                        onTap: () {
                                          Navigator.pop(context);
                                          Navigator.pushAndRemoveUntil<dynamic>(
                                            context,
                                            MaterialPageRoute<dynamic>(
                                              builder: (BuildContext context) =>
                                                  const SearchFilter(),
                                            ),
                                            (route) => true,
                                            //if you want to disable back feature set to false
                                          );
                                        },
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
              endDrawer: Drawer(
                width: MediaQuery.of(context).size.width / 1.4,
                child: GroupInfo(),
              ),
              bottomSheet: ChatInputBox(
                controller: chatController,
              ),
            )));
  }
}
