import 'package:flutter/material.dart';
class MyTask extends StatefulWidget {
  const MyTask({super.key});

  @override
  State<MyTask> createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
       appBar: AppBar(
          backgroundColor: Color.fromRGBO(1, 123, 255, 1),
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
          
        },),
        title: Text("My Task"),
      ),
      
      )

    );
  }
}