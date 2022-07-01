// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, file_names, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:linkus/screens/Landing%20Files/widgets.dart';
import 'package:linkus/screens/calendar/mycalendar.dart';
import 'package:linkus/screens/change%20Password/change_password.dart';
import 'package:linkus/screens/profile/my_profile.dart';
import 'package:linkus/screens/project_milestone/project_milestone.dart';

import 'contactTab.dart';
import 'groupTab.dart';
import 'recentTab.dart';

class landingPage extends StatefulWidget {
  const landingPage({super.key});

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  bool profImg = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                    backgroundColor: Color.fromRGBO(1, 123, 255, 1),
                    leading: Padding(
                      padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: profImg
                              ? Icon(
                                  Icons.person,
                                )
                              : Icon(Icons.abc)),
                    ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'User 1',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Junior Developer',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    actions: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          dividerTheme: DividerThemeData(
                              color: Colors.black, thickness: 0.5),
                          iconTheme: IconThemeData(color: Colors.white),
                        ),
                        child: PopupMenuButton(
                          color: Color.fromRGBO(1, 123, 255, 1),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Column(
                                children: [
                                  Mainmenu(
                                      value: 1,
                                      text: "My Profile",
                                      Icon: Icon(Icons.person),
                                      height: 0,
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.pushAndRemoveUntil<dynamic>(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                            builder: (BuildContext context) =>
                                                ProfilePage(),
                                          ),
                                          (route) => true,
                                          //if you want to disable back feature set to false
                                        );
                                      }),
                                  PopupMenuDivider()
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              child: Mainmenu(
                                value: 3,
                                text: "My Calendar",
                                Icon: Icon(Icons.calendar_month),
                                height: 0,
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pushAndRemoveUntil<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) =>
                                          Calendar(),
                                    ),
                                    (route) => true,
                                    //if you want to disable back feature set to false
                                  );
                                },
                              ),
                            ),
                            PopupMenuItem(
                              child: Mainmenu(
                                value: 4,
                                text: "My Task",
                                Icon: Icon(Icons.task),
                                height: 0,
                                onTap: () {
                                  // Navigator.pop(context);
                                  // Navigator.pushAndRemoveUntil<dynamic>(
                                  //   context,
                                  //   MaterialPageRoute<dynamic>(
                                  //     builder: (BuildContext context) =>
                                  //         ProfilePage(),
                                  //   ),
                                  //   (route) => true,
                                  //   //if you want to disable back feature set to false
                                  // );
                                },
                              ),
                            ),
                            PopupMenuItem(
                              child: Mainmenu(
                                value: 5,
                                text: "My Shelf",
                                Icon: Icon(Icons.bookmark),
                                height: 0,
                                onTap: () {
                                  Navigator.pop(context);
                                  Navigator.pushAndRemoveUntil<dynamic>(
                                    context,
                                    MaterialPageRoute<dynamic>(
                                      builder: (BuildContext context) =>
                                          ProfilePage(),
                                    ),
                                    (route) => true,
                                    //if you want to disable back feature set to false
                                  );
                                },
                              ),
                            ),
                            PopupMenuItem(
                              child: Mainmenu(
                                  value: 2,
                                  text: "Change Password",
                                  Icon: Icon(Icons.key),
                                  height: 0,
                                  onTap: () {
                                    Navigator.pop(context);
                                    Navigator.pushAndRemoveUntil<dynamic>(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                            ChangePassword(),
                                      ),
                                      (route) => true,
                                      //if you want to disable back feature set to false
                                    );
                                  }),
                            ),
                            PopupMenuItem(
                              child: Mainmenu(
                                value: 6,
                                text: "MOM",
                                Icon: Icon(Icons.handshake_outlined),
                                height: 0,
                                onTap: () {
                                  // Navigator.pop(context);
                                  // Navigator.pushAndRemoveUntil<dynamic>(
                                  //   context,
                                  //   MaterialPageRoute<dynamic>(
                                  //     builder: (BuildContext context) =>
                                  //         ProfilePage(),
                                  //   ),
                                  //   (route) => true,
                                  //   //if you want to disable back feature set to false
                                  // );
                                },
                              ),
                            ),
                            PopupMenuItem(
                              child: Mainmenu(
                                value: 7,
                                text: "Starred",
                                Icon: Icon(Icons.star),
                                height: 0,
                                onTap: () {
                                  // Navigator.pop(context);
                                  // Navigator.pushAndRemoveUntil<dynamic>(
                                  //   context,
                                  //   MaterialPageRoute<dynamic>(
                                  //     builder: (BuildContext context) =>
                                  //         ProfilePage(),
                                  //   ),
                                  //   (route) => true,
                                  //   //if you want to disable back feature set to false
                                  // );
                                },
                              ),
                            ),
                            PopupMenuItem(
                              child: Mainmenu(
                                value: 8,
                                text: "Customization",
                                Icon: Icon(Icons.dashboard_customize),
                                height: 0,
                                onTap: () {
                                  // Navigator.pop(context);
                                  // Navigator.pushAndRemoveUntil<dynamic>(
                                  //   context,
                                  //   MaterialPageRoute<dynamic>(
                                  //     builder: (BuildContext context) =>
                                  //         ProfilePage(),
                                  //   ),
                                  //   (route) => true,
                                  //   //if you want to disable back feature set to false
                                  // );
                                },
                              ),
                            ),
                            PopupMenuItem(
                              child: Mainmenu(
                                value: 9,
                                text: "Birthday",
                                Icon: Icon(Icons.cake),
                                height: 0,
                                onTap: () {
                                  // Navigator.pop(context);
                                  // Navigator.pushAndRemoveUntil<dynamic>(
                                  //   context,
                                  //   MaterialPageRoute<dynamic>(
                                  //     builder: (BuildContext context) =>
                                  //         ProfilePage(),
                                  //   ),
                                  //   (route) => true,
                                  //   //if you want to disable back feature set to false
                                  // );
                                },
                              ),
                            ),
                            PopupMenuItem(
                              child: Mainmenu(
                                value: 10,
                                text: "Project Milestone",
                                Icon: Icon(Icons.tornado),
                                height: 0,
                                onTap: () {
                                  // Navigator.pop(context);
                                  // Navigator.pushAndRemoveUntil<dynamic>(
                                  //   context,
                                  //   MaterialPageRoute<dynamic>(
                                  //     builder: (BuildContext context) =>
                                  //         ProfilePage(),
                                  //   ),
                                  //   (route) => true,
                                  //   //if you want to disable back feature set to false
                                  // );
                                },
                              ),
                            ),
                            PopupMenuItem(
                              child: Mainmenu(
                                value: 11,
                                text: "LogOut",
                                Icon: Icon(Icons.logout),
                                height: 0,
                                onTap: () {
                                  // Navigator.pop(context);
                                  // Navigator.pushAndRemoveUntil<dynamic>(
                                  //   context,
                                  //   MaterialPageRoute<dynamic>(
                                  //     builder: (BuildContext context) =>
                                  //         ProfilePage(),
                                  //   ),
                                  //   (route) => true,
                                  //   //if you want to disable back feature set to false
                                  // );
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],

                    // )
                    // ],

                    bottom: const TabBar(tabs: [
                      Tab(
                          icon: Text(
                        'Recent',
                        style: TextStyle(fontSize: 18),
                      )),
                      Tab(
                          icon: Text(
                        'Contacs',
                        style: TextStyle(fontSize: 18),
                      )),
                      Tab(
                          icon: Text(
                        'Groups',
                        style: TextStyle(fontSize: 18),
                      )),
                    ])),
                body: TabBarView(
                  children: const [
                    Tab(icon: recentTab()),
                    Tab(icon: contactsTab()),
                    Tab(icon: groupTab()),
                  ],
                ),
              ),
            )));
  }
}
