import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class GroupInfo extends StatefulWidget {
  const GroupInfo({super.key});

  @override
  State<GroupInfo> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppBar(
        title: Text('Flutter Team'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.close))],
      ),
    );
  }
}
