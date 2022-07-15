import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:linkus/screens/chatscreen%20Files/dataList.dart';

import '../../variables/Api_Control.dart';

import 'package:http/http.dart' as http;

class NewGroup extends StatefulWidget {
  const NewGroup({super.key});

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                for (var i = 0; i < listItems.length; i++) {
                  listItems[i].isChecked = false;
                }
              });
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
            )),
        leadingWidth: 35,
        title: const Text('Contacts'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              elevation: 5,
              child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      label: Text('Search'),
                      contentPadding: EdgeInsets.symmetric())),
            ),
          ),
          NewGroupContact(
              profIcon: const Icon(Icons.person),
              msgText: null,
              contactName: null,
              ntfctnCnt: null,
              msgdte$tme: const SizedBox(),
              ItmCnt: null,
              onTap: () {}),
        ],
      ),
      bottomSheet: TextFormField(
        decoration: InputDecoration(
            suffixIcon: isVisible
                ? TextButton(
                    onPressed: () {
                      setState(() {
                        isVisible = true;
                        for (var i = 0; i < listItems.length; i++) {
                          if (listItems[i].isChecked == true) {
                            listItems[i].isChecked = false;
                          }
                        }

                        for (var i = 0; i < listItems.length; i++) {
                          if (listItems[i].isChecked == true) {
                            listItems[i].isChecked = true;
                          } else if (listItems[i].isChecked == false) {
                            listItems[i].isChecked = true;
                          }
                        }
                        isVisible = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: const Text(
                        'Select all',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w800),
                      ),
                    ),
                  )
                : InkWell(
                    onTap: () {
                      setState(() {
                        for (var i = 0; i < listItems.length; i++) {
                          listItems[i].isChecked = false;
                        }
                        isVisible = true;
                      });
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Text(
                        'Unselect all',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
            hintText: 'Type a Group Name',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
      ),
    );
  }
}

class NewGroupContact extends StatefulWidget {
  final profIcon;
  final msgText;
  final contactName;
  final ntfctnCnt;
  final msgdte$tme;
  final ItmCnt;
  final onTap;
  const NewGroupContact({
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
  State<NewGroupContact> createState() => _NewGroupContactState();
}

class _NewGroupContactState extends State<NewGroupContact> {
  var photo;
  bool? hidephoto;
  bool checkedValue = false;

  void initState() {
    setState(() {
      WidgetsBinding.instance.addPostFrameCallback((_) => Data());
      super.initState();
    });
  }

  Data() async {
    Map data = {"compid": "1"};
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
    print("length:${(response.body).length}");
    //  print("result:${response.body}");

    Contactmodel.add((jsonDecode(response.body)));

    print("length:${jsonDecode(response.body).length}");
    listItems.clear();
    for (var i = 0; i < jsonDecode(response.body).length; i++) {
      listItems.add(Employee(
          id: i + 1,
          Name: jsonDecode(response.body)[i]['username'] ?? "",
          jobProfile: jsonDecode(response.body)[i]['designation'] ?? "",
          photourl: jsonDecode(response.body)[i]["photourl"] ?? "",
          isChecked: false));
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          // shrinkWrap: true,

          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            final employee = listItems[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.trailing,
                value: employee.isChecked,
                onChanged: (newValue) {
                  setState(() {
                    employee.isChecked = newValue!;
                  });
                },
                title: Text(listItems[index].Name),
                secondary: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    backgroundImage:
                        NetworkImage(listItems[index].photourl ?? "")),
                subtitle: Text(listItems[index].jobProfile),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider()),
    );
  }
}
