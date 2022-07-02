// import 'dart:html';
// import 'dart:ui';

// import 'package:calendar_view/calendar_view.dart';
import'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../Login Files/login_textfield.dart';
import 'date_time.dart';
class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> with SingleTickerProviderStateMixin {
  var title=TextEditingController();
  var description=TextEditingController();
  TabController? _tabController;
  bool addEvent = false;
  @override
  void initState() {
    super.initState();
    description.addListener(() {
      setState(() {
          
        addEvent = title.text.isNotEmpty &&
           description.text.isNotEmpty;
          
          // _tabController = new TabController(length: 3, vsync: this);
            
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.%$
    title.dispose();
   // description.dispose();
    super.dispose();
  }


 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: 
      Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: 
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/2.5,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff0c84b4).withOpacity(0.2)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("New Event",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),
                        SizedBox(height: 10,),
                         MasterTextField(
                          hintText: "Title",
                           Controller: title,
                            PrefixIcon: null, 
                           enabledborder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                )),
                                focusedborder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                
                              ),
                              fillColor: null,
                               filled: false,
                                obscureText: false,
                                 contentPadding: EdgeInsets.symmetric(vertical: 15),
                                  keyboardType: null),
                     SizedBox(height: 10,),
                         MasterTextField(
                          hintText: "Description",
                           Controller: description,
                            PrefixIcon: null, 
                           enabledborder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                )),
                                focusedborder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                
                              ),
                              fillColor: null,
                               filled: false,
                                obscureText: false,
                                 contentPadding: EdgeInsets.symmetric(vertical: 15),
                                  keyboardType: TextInputType.multiline),
                                
                                  CalenderWidget(
                            hintText: "Start",
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 365)),
                              LastDate:
                                  DateTime.now().add(Duration(days: 365))),
                                   CalenderWidget(
                            hintText: "End",
                              firstDate:
                                  DateTime.now().subtract(Duration(days: 365)),
                              LastDate:
                                  DateTime.now().add(Duration(days: 365))),
                                  SizedBox(height: 10,),
                                   SizedBox(
                    width: MediaQuery.of(context).size.width / 1.4,
                    
                    child: ElevatedButton(
                      onPressed: addEvent
                          ? () {
                              
                            }
                          : null,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.blue.withOpacity(0.3);
                          }
                          return Colors.blue;
                        }),
                      ),
                      child: const Text(
                        "ADD EVENT",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                
        
                    
                      ],
                    ),
                  )
                
                ),
                SizedBox(height: 10,),
                TabBar(
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.white,
                  
                  
                  
                  
                  tabs: [
                    Container(
                      width: MediaQuery.of(context).size.width/4,
                      height: MediaQuery.of(context).size.height/24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue,
                      ),
                      child: Tab(
                       // icon: Icon(Icons.person),
                        text: "Month",
                      ),
                    ),
                   Container(
                      width: MediaQuery.of(context).size.width/4,
                      height: MediaQuery.of(context).size.height/24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue
                      ),
                      child: Tab(
                       // icon: Icon(Icons.person),
                        text: "Week",
                      ),
                    ),
                  
                    Container(
                      width: MediaQuery.of(context).size.width/4,
                      height: MediaQuery.of(context).size.height/24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blue
                      ),
                      child: Tab(
                       // icon: Icon(Icons.person),
                        text: "Day",
                      ),
                    ),
                  
                   
                  ],
                //  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                
                SizedBox(
                  height: MediaQuery.of(context).size.height/2.7,
                  child: TabBarView(
                    children: [
                      SizedBox(
                        height: 100,
                        child: SfCalendar(
                          view: CalendarView.month,
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: SfCalendar(
                          view: CalendarView.week,
                        ),
                      ),
                       SizedBox(
                        height: MediaQuery.of(context).size.height/100,
                         child: SfCalendar(
                          view: CalendarView.day,
                      ),
                       )
                      
                      
                    ],
                   // controller: _tabController,
                  
                  ),
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}