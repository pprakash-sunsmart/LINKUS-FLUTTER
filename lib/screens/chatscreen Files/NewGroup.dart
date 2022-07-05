// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class NewGroup extends StatefulWidget {
  const NewGroup({super.key});

  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
              msgText: const Text('Junior Developer'),
              contactName: const Text('Developer'),
              ntfctnCnt: Checkbox(
                onChanged: null,
                value: value,
              ),
              msgdte$tme: const SizedBox(),
              ItmCnt: 20,
              onTap: () {}),
        ],
      ),
      bottomSheet: TextFormField(
        decoration: InputDecoration(
            suffixIcon: TextButton(
              onPressed: () {},
              child: const Text(
                'Select all',
                style: TextStyle(color: Colors.black),
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
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: widget.ItmCnt,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
                title: const Text('Developer'),
                value: timeDilation != 1,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 0.9 : 1;
                  });
                },
                secondary: const CircleAvatar(child: Icon(Icons.person)));
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider()),
    );
  }
}
