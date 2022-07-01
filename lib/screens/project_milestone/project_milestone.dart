import'package:flutter/material.dart';

import '../Login Files/login_textfield.dart';
class ProjectMilestone extends StatefulWidget {
  const ProjectMilestone({super.key});

  @override
  State<ProjectMilestone> createState() => _ProjectMilestoneState();
}

class _ProjectMilestoneState extends State<ProjectMilestone> {
  bool _showContainer = false;

  @override
  void initState() {
    _showContainer = false;
    super.initState();
  }

  void show() {
    setState(() {
      _showContainer = !_showContainer;
    });
  }
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
        title: Text("Project Milestone"),
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
           Row(
          
            children: [
            ElevatedButton(onPressed: (){
              show();
            },
             style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
               return  Color(0xff0c84b4);
              return  Color(0xff0c84b4);
            },
          ),),
             child: Row(
             
              children:[
              Icon(Icons.add_circle,size: 15,),
              Text("Create Milestone")
              ]
             )),
             ElevatedButton(onPressed: (){},
             style: ButtonStyle(
             backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed))
               return  Color(0xff0c84b4);
              return  Color(0xff0c84b4);
            },),
            ),
             child: Row(
              children:[
              Icon(Icons.visibility,size: 15,),
              Text("View Milestone")
              ]
             ))
           ],) ,
            Visibility(
              child: SampleContainer(),
              visible: _showContainer,
            ),
          ],
        ),
      ),),
    );
  }
}class SampleContainer extends StatefulWidget {
  @override
  _SampleContainerState createState() => _SampleContainerState();
}

class _SampleContainerState extends State<SampleContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
     child: Column(
      children: [
        
        Card(
          color: Colors.grey,
          child: Row(
            children: [
              Text("Project Name"),
              Text("*",
              style: TextStyle(
                color: Colors.red
              ),), ],
          ),
          
        )
      ],
     )
      
    );
  }
}