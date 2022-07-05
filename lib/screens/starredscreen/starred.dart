import 'package:flutter/material.dart';
class Starred extends StatefulWidget {
  const Starred({super.key});

  @override
  State<Starred> createState() => _StarredState();
}

class _StarredState extends State<Starred> {
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
title: Text("Starred Message",
style: TextStyle(
  letterSpacing: 1
),),
      ),
      body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/chatBackground.jpg',
                    ),
                    fit: BoxFit.cover)),

      ),
    );
  }
}