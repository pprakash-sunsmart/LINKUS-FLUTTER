import 'package:flutter/material.dart';

import 'btdy_model.dart';
class BirthdayPage extends StatefulWidget {
  const BirthdayPage({super.key});

  @override
  State<BirthdayPage> createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: const Color.fromRGBO(1, 123, 255, 1),
automaticallyImplyLeading: false,
leading: IconButton(icon: Icon(Icons.arrow_back),
onPressed: (){
  Navigator.pop(context);
},),
title: Text("Birthdays",
style: TextStyle(
  letterSpacing: 1
),),
      ),
      body: Column(
        children: [
 Card(
                                      elevation: 5,
                                      child: TextFormField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon: Icon(Icons.search),
                                              label: Text('Search'),
                                              contentPadding: EdgeInsets.symmetric())),
                                    ),
                           BirthdayModel(
                            profIcon: Icon(Icons.person),
                             msgText: null, 
                             contactName: null,
                              ntfctnCnt: null, 
                              msgdte$tme: Text(''), 
                              ItmCnt: null,
                               onTap: null,
                                btdy: Text("18/8/94"))         
     
        ],
      ),
    );
  }
}