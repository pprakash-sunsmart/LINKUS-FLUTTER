// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:linkus/screens/change%20Password/change_password.dart';
import 'package:linkus/screens/profile/my_profile.dart';


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
                      child: PopupMenuButton<int>(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 1,
                            height: 0,
                            child: 
                            InkWell(
                              onTap: (){
                               Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) {
                return ProfilePage();
              },
            ),
            (_) => true);},
                              child: Row(
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "My Profile",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          PopupMenuDivider(),
                          // popupmenu item 2
                          PopupMenuItem(
                            value: 2,
                            height: 0,
                            child: 
                            InkWell(
                              onTap: (){
                               Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) {
                return ChangePassword();
              },
            ),
            (_) => true);},
                              child: Row(
                                children: [
                                  Icon(Icons.key),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Change Password",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            height: 0,
                            value: 3,
                            // row has two child icon and text
                            child: Row(
                              children: [
                                Icon(Icons.calendar_month),
                                SizedBox(
                                  // sized box with width 10
                                  width: 10,
                                ),
                                Text(
                                  "My Calendar",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            value: 4,
                            height: 0,
                            // row has two child icon and text
                            child: Row(
                              children: [
                                Icon(Icons.task),
                                SizedBox(
                                  // sized box with width 10
                                  width: 10,
                                ),
                                Text(
                                  "My task",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            value: 5,
                            height: 0,
                            // row has two child icon and text
                            child: Row(
                              children: [
                                Icon(Icons.bookmark),
                                SizedBox(
                                  // sized box with width 10
                                  width: 10,
                                ),
                                Text(
                                  "My Shelf",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            value: 6,
                            height: 0,
                            // row has two child icon and text
                            child: Row(
                              children: [
                                Icon(Icons.handshake_outlined),
                                SizedBox(
                                  // sized box with width 10
                                  width: 10,
                                ),
                                Text(
                                  "MOM",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            value: 6,
                            height: 0,
                            // row has two child icon and text
                            child: Row(
                              children: [
                                Icon(Icons.star),
                                SizedBox(
                                  // sized box with width 10
                                  width: 10,
                                ),
                                Text(
                                  "Starred",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            height: 0,
                            value: 7,
                            // row has two child icon and text
                            child: Row(
                              children: [
                                Icon(Icons.dashboard_customize_outlined),
                                SizedBox(
                                  // sized box with width 10
                                  width: 10,
                                ),
                                Text(
                                  "Customization",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            value: 8,
                            height: 0,
                            // row has two child icon and text
                            child: Row(
                              children: [
                                Icon(Icons.cake),
                                SizedBox(
                                  // sized box with width 10
                                  width: 10,
                                ),
                                Text(
                                  "Birthday",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          PopupMenuDivider(),

                          PopupMenuItem(
                            value: 9,
                            height: 0,
                            // row has two child icon and text
                            child: Row(
                              children: [
                                Icon(Icons.approval_sharp),
                                SizedBox(
                                  // sized box with width 10
                                  width: 10,
                                ),
                                Text(
                                  "Project MileStone",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                          PopupMenuDivider(),

                          PopupMenuItem(
                            height: 0,
                            // row has two child icon and text
                            child: Row(
                              children: [
                                Icon(Icons.logout),
                                SizedBox(
                                  // sized box with width 10
                                  width: 10,
                                ),
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                        color: Color.fromRGBO(1, 123, 255, 1),
                      ),
                    )
                  ],
                  bottom: const TabBar(
                    tabs: [
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
                    ],
                  ),
                ),
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
