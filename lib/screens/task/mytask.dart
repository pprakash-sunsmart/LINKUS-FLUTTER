import 'package:flutter/material.dart';
import 'package:linkus/screens/calendar/date_time.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
               CalenderWidget(
                            hintText: "From",
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 365)),
                              LastDate:
                                  DateTime.now().add(Duration(days: 365))),
                                   CalenderWidget(
                            hintText: "To",
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 365)),
                              LastDate:
                                  DateTime.now().add(Duration(days: 365))),
                                  SizedBox(height: 5,),
                                    Card(
                                      elevation: 5,
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.search),
                                              label: Text('Search'),
                                              contentPadding: EdgeInsets.symmetric())),
                                    ),
     
        
                               
          ],
        ),
      ),
      
      )

    );
  }
}