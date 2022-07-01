import'package:flutter/material.dart';
class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(1, 123, 255, 1),
        ),
        body: Column(
          children: [
            Card(
              color: Colors.blue,
              elevation: 2,
            ),
          ],
        ),
      ),
    );
  }
}