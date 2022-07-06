// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, file_names, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:linkus/screens/Customization/custom_page.dart';
import 'package:linkus/screens/Landing%20Files/widgets.dart';
import 'package:linkus/screens/Login%20Files/loginscreen.dart';
import 'package:linkus/screens/birthday/birthday_page.dart';
import 'package:linkus/screens/calendar/mycalendar.dart';
import 'package:linkus/screens/change%20Password/change_password.dart';
import 'package:linkus/screens/momscreen/mom.dart';

import 'package:linkus/screens/profile/my_profile.dart';
import 'package:linkus/screens/project_milestone/project_milestone.dart';
import 'package:linkus/screens/project_milestone/project_page.dart';
import 'package:linkus/screens/starredscreen/starred.dart';
import 'package:linkus/screens/task/mytask.dart';

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
            // ignore: sort_child_properties_last
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                    backgroundColor: Color.fromRGBO(1, 123, 255, 1),
                    leading: Padding(
                      padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => ProfilePage(),
                            ),
                            (route) => true,
                            //if you want to disable back feature set to false
                          );
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: profImg
                                ? Icon(
                                    Icons.person,
                                  )
                                : Icon(Icons.abc)),
                      ),
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
                                    child: Column(children: [
                                      Container(
                                        // width:
                                        //     MediaQuery.of(context).size.width,
                                        // height: 20,
                                        child: Mainmenu(
                                            value: 1,
                                            text: "My Profile",
                                            Icon: Icon(
                                              Icons.person,
                                              size: 15,
                                            ),
                                            height: 0,
                                            onTap: () {
                                              Navigator.pop(context);
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
                                            }),
                                      ),
                                      PopupMenuDivider(),
                                    ]),
                                  ),
                                  PopupMenuItem(
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                            value: 2,
                                            text: "Change Password",
                                            Icon: Icon(
                                              Icons.key,
                                              size: 15,
                                            ),
                                            height: 0,
                                            onTap: () {
                                              Navigator.pop(context);
                                              Navigator.pushAndRemoveUntil<
                                                  dynamic>(
                                                context,
                                                MaterialPageRoute<dynamic>(
                                                  builder:
                                                      (BuildContext context) =>
                                                          ChangePassword(),
                                                ),
                                                (route) => true,
                                                //if you want to disable back feature set to false
                                              );
                                            }),
                                        PopupMenuDivider(),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                          value: 3,
                                          text: "My Calendar",
                                          Icon: Icon(
                                            Icons.calendar_month,
                                            size: 15,
                                          ),
                                          height: 0,
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.pushAndRemoveUntil<
                                                dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder:
                                                    (BuildContext context) =>
                                                        Calendar(),
                                              ),
                                              (route) => true,
                                              //if you want to disable back feature set to false
                                            );
                                          },
                                        ),
                                        PopupMenuDivider(),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                          value: 4,
                                          text: "My Task",
                                          Icon: Icon(
                                            Icons.task,
                                            size: 15,
                                          ),
                                          height: 0.1,
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.pushAndRemoveUntil<
                                                dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder:
                                                    (BuildContext context) =>
                                                        MyTask(),
                                              ),
                                              (route) => true,
                                              //if you want to disable back feature set to false
                                            );
                                          },
                                        ),
                                        PopupMenuDivider(),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                          value: 5,
                                          text: "My Shelf",
                                          Icon: Icon(
                                            Icons.bookmark,
                                            size: 15,
                                          ),
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
                                        PopupMenuDivider(),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                          value: 6,
                                          text: "MOM",
                                          Icon: Icon(
                                            Icons.handshake_outlined,
                                            size: 15,
                                          ),
                                          height: 0,
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.pushAndRemoveUntil<
                                                dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder:
                                                    (BuildContext context) =>
                                                        MOM(),
                                              ),
                                              (route) => true,
                                              //if you want to disable back feature set to false
                                            );
                                          },
                                        ),
                                        PopupMenuDivider(),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                          value: 7,
                                          text: "Starred",
                                          Icon: Icon(
                                            Icons.star,
                                            size: 15,
                                          ),
                                          height: 0,
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.pushAndRemoveUntil<
                                                dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder:
                                                    (BuildContext context) =>
                                                        Starred(),
                                              ),
                                              (route) => true,
                                              //if you want to disable back feature set to false
                                            );
                                          },
                                        ),
                                        PopupMenuDivider(),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                          value: 8,
                                          text: "Customization",
                                          Icon: Icon(
                                            Icons.dashboard_customize,
                                            size: 15,
                                          ),
                                          height: 0,
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.pushAndRemoveUntil<
                                                dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder:
                                                    (BuildContext context) =>
                                                        CustomPage(),
                                              ),
                                              (route) => true,
                                              //if you want to disable back feature set to false
                                            );
                                          },
                                        ),
                                        PopupMenuDivider(),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                          value: 9,
                                          text: "Birthday",
                                          Icon: Icon(
                                            Icons.cake,
                                            size: 15,
                                          ),
                                          height: 0,
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.pushAndRemoveUntil<
                                                dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder:
                                                    (BuildContext context) =>
                                                        BirthdayPage(),
                                              ),
                                              (route) => true,
                                              //if you want to disable back feature set to false
                                            );
                                          },
                                        ),
                                        PopupMenuDivider(),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                          value: 10,
                                          text: "Project Milestone",
                                          Icon: Icon(
                                            Icons.tornado,
                                            size: 15,
                                          ),
                                          height: 0,
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.pushAndRemoveUntil<
                                                dynamic>(
                                              context,
                                              MaterialPageRoute<dynamic>(
                                                builder:
                                                    (BuildContext context) =>
                                                        ProjectPage(),
                                              ),
                                              (route) => true,
                                              //if you want to disable back feature set to false
                                            );
                                          },
                                        ),
                                        PopupMenuDivider(),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Column(
                                      children: [
                                        Mainmenu(
                                            value: 11,
                                            text: "LogOut",
                                            Icon: Icon(
                                              Icons.logout,
                                              size: 15,
                                            ),
                                            height: 0,
                                            onTap: () {
                                              Navigator.pop(context);

                                              showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return WillPopScope(
                                                      onWillPop: () async =>
                                                          false,
                                                      child: AlertDialog(
                                                        title: const Text(
                                                          'Are you sure to Logout?',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15),
                                                        ),
                                                        actions: <Widget>[
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                shadowColor:
                                                                    Colors.grey,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12))),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                'CANCEL'),
                                                          ),
                                                          ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                shadowColor:
                                                                    Colors.grey,
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12))),
                                                            onPressed: () =>
                                                                Navigator
                                                                    .pushAndRemoveUntil<
                                                                        dynamic>(
                                                              context,
                                                              MaterialPageRoute<
                                                                  dynamic>(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    LoginScreen(),
                                                              ),
                                                              (route) => false,
                                                              //if you want to disable back feature set to false
                                                            ),
                                                            child: const Text(
                                                                'OK'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            }),
                                        PopupMenuDivider(),
                                      ],
                                    ),
                                  ),
                                ]),
                      ),

                      // )
                    ],
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
                bottomSheet: footer(),
              ),
            )));
  }
}
