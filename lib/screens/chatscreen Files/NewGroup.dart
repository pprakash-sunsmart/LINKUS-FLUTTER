// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:linkus/screens/chatscreen%20Files/dataList.dart';

import 'dataList.dart';

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
                for (var i = 0; i < Employees.length; i++) {
                  Employees[i].isChecked = false;
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
                        for (var i = 0; i < Employees.length; i++) {
                          if (Employees[i].isChecked == true) {
                            Employees[i].isChecked = false;
                          }
                        }

                        for (var i = 0; i < Employees.length; i++) {
                          if (Employees[i].isChecked == true) {
                            Employees[i].isChecked = true;
                          } else if (Employees[i].isChecked == false) {
                            Employees[i].isChecked = true;
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
                        for (var i = 0; i < Employees.length; i++) {
                          Employees[i].isChecked = false;
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
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          // shrinkWrap: true,

          itemCount: Employees.length,
          itemBuilder: (BuildContext context, int index) {
            final employee = Employees[index];
            return CheckboxListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              value: employee.isChecked,
              onChanged: (newValue) {
                setState(() {
                  employee.isChecked = newValue!;
                });
              },
              title: Text(Employees[index].Name),
              secondary: CircleAvatar(child: Icon(Icons.person)),
              subtitle: Text(Employees[index].jobProfile),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider()),
    );
  }
}
