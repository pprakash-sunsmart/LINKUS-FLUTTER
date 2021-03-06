// ignore_for_file: duplicate_import, camel_case_types, file_names, prefer_const_constructors_in_immutables, non_constant_identifier_names, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:linkus/screens/chatscreen%20Files/dataList.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../variables/Api_Control.dart';
import 'allcontacts.dart';
import 'liveContacts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class contactsTab extends StatefulWidget {
  contactsTab({
    super.key,
  });

  @override
  State<contactsTab> createState() => _contactsTabState();
}

class _contactsTabState extends State<contactsTab> {
  int index = 0;

  int listlength = 0;
  int length = 0;
  var companyid;

  @override
  void initState() {
    super.initState();

    Data();
    listItems.clear();
    liveItems.clear();
  }

  Data() async {
    final prefs = await SharedPreferences.getInstance();

    companyid = await prefs.getString('compid');
    Map data = {"compid": companyid};
    print(data);
    String body = json.encode(data);
    print(body);

    var response = await http.post(
      Uri.parse(Contacts_Api),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
    );

    Contactmodel.add((jsonDecode(response.body)));
    var responseOfStatusCode1 = response.statusCode;
    print('{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{{}{}$responseOfStatusCode1');

    // print('++++++++++++++++++++++++++++++++++++>>>>>>>$responseOfStatusCode');
    for (var i = 0; i < jsonDecode(response.body).length; i++) {
      responseOfStatusCode = responseOfStatusCode1;
      print('++++++++++++++++++++++++++++++++++++>>>>>>>$responseOfStatusCode');
      if (jsonDecode(response.body)[i]["status"] == "online" ||
          jsonDecode(response.body)[i]["status"] == "Offline" ||
          jsonDecode(response.body)[i]["status"] == "offline") {
        listItems.add(Employee(
          id: i + 1,
          Name: jsonDecode(response.body)[i]['username'] ?? "",
          jobProfile: jsonDecode(response.body)[i]['designation'] ?? "",
          photourl: jsonDecode(response.body)[i]["photourl"] ?? "",
          isChecked: false,
          status: jsonDecode(response.body)[i]["status"] ?? "",
        ));
      }
      if (jsonDecode(response.body)[i]["status"] == "online") {
        liveItems.add(Employee(
            id: i + 1,
            Name: jsonDecode(response.body)[i]['username'] ?? "",
            jobProfile: jsonDecode(response.body)[i]['designation'] ?? "",
            photourl: jsonDecode(response.body)[i]["photourl"] ?? "",
            isChecked: false,
            status: jsonDecode(response.body)[i]["status"] ?? "",
            responseOfStatusCode: responseOfStatusCode));

        print("res------$length");
      }

      // print("ans----$listlength");
      // print("xyz---$length");
    }

    setState(() {
      listlength = listItems.length;
      length = liveItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: TabBar(tabs: [
            SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Expanded(
                        child: Text(
                          'All contacts($listlength)',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Expanded(
                        child: Text(
                          'Live Contacts($length)',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
        body: const TabBarView(
          children: [
            Tab(
              icon: allContacts(),
            ),
            Tab(icon: liveContacts()),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: duplicate_import, camel_case_types, file_names, prefer_const_constructors_in_immutables, non_constant_identifier_names, avoid_print

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:linkus/screens/chatscreen%20Files/dataList.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../variables/Api_Control.dart';
// import 'allcontacts.dart';
// import 'liveContacts.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class contactsTab extends StatefulWidget {
//   contactsTab({
//     super.key,
//   });

//   @override
//   State<contactsTab> createState() => _contactsTabState();
// }

// class _contactsTabState extends State<contactsTab> {
//   int index = 0;

//   int listlength = 0;
//   int length = 0;

//   @override
//   void initState() {
//     super.initState();

//     Data();
//     listItems.clear();
//     liveItems.clear();
//   }

//   var companyid;
//   Data() async {
//     final prefs = await SharedPreferences.getInstance();

//     companyid = await prefs.getString('compid');
//     Map data = {"compid": companyid};
//     print(data);
//     String body = json.encode(data);
//     print(body);

//     var response = await http.post(
//       Uri.parse(Contacts_Api),
//       body: body,
//       headers: {
//         "Content-Type": "application/json",
//         "accept": "application/json",
//         "Access-Control-Allow-Origin": "*",
//       },
//     );

//     Contactmodel.add((jsonDecode(response.body)));
//     var responseOfStatusCode1 = response.statusCode;
//     print('{}{}{}{}{}{}{}{}{}{}{}{}{}{}{}{{}{}$responseOfStatusCode1');

//     // print('++++++++++++++++++++++++++++++++++++>>>>>>>$responseOfStatusCode');
//     for (var i = 0; i < jsonDecode(response.body).length; i++) {
//       responseOfStatusCode = responseOfStatusCode1;
//       print('++++++++++++++++++++++++++++++++++++>>>>>>>$responseOfStatusCode');
//       if (jsonDecode(response.body)[i]["status"] == "online" ||
//           jsonDecode(response.body)[i]["status"] == "Offline" ||
//           jsonDecode(response.body)[i]["status"] == "offline") {
//         listItems.add(Employee(
//           id: i + 1,
//           Name: jsonDecode(response.body)[i]['username'] ?? "",
//           jobProfile: jsonDecode(response.body)[i]['designation'] ?? "",
//           photourl: jsonDecode(response.body)[i]["photourl"] ?? "",
//           isChecked: false,
//           status: jsonDecode(response.body)[i]["status"] ?? "",
//         ));
//       }
//       if (jsonDecode(response.body)[i]["status"] == "online") {
//         liveItems.add(Employee(
//             id: i + 1,
//             Name: jsonDecode(response.body)[i]['username'] ?? "",
//             jobProfile: jsonDecode(response.body)[i]['designation'] ?? "",
//             photourl: jsonDecode(response.body)[i]["photourl"] ?? "",
//             isChecked: false,
//             status: jsonDecode(response.body)[i]["status"] ?? "",
//             responseOfStatusCode: responseOfStatusCode));

//         print("res------$length");
//       }

//       // print("ans----$listlength");
//       // print("xyz---$length");
//     }

//     setState(() {
//       listlength = listItems.length;
//       length = liveItems.length;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//           title: TabBar(tabs: [
//             SizedBox(
//               height: 50,
//               child: Center(
//                 child: Row(
//                   children: [
//                     Text(
//                       'All contacts($listlength)',
//                       style: const TextStyle(color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 50,
//               child: Center(
//                 child: Text(
//                   'Live Contacts ($length)',
//                   style: const TextStyle(color: Colors.black),
//                 ),
//               ),
//             ),
//           ]),
//         ),
//         body: TabBarView(
//           children: [
//             Tab(
//               icon: allContacts(),
//             ),
//             Tab(icon: liveContacts()),
//           ],
//         ),
//       ),
//     );
//   }
// }
