// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:linkus/screens/Login%20Files/loginscreen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Link Us',
      home: LoginScreen()
    );
  }
}


class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Launch',),
            actions: [IconButton(icon: Icon(Icons.share_outlined), onPressed: () {})],
          ),
          body: Column(
            children: [
             Container(),
              Container(
                height: 70,
                child: AppBar(
                  centerTitle: true,
                  title: Text("New Titile"),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'State',),
                      Tab(text: 'Mission',),
                      Tab(text: 'Rocket',)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Text('Tab 1',),
                    Text('Tab 2'),
                    Text('Tab 3')
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
//     return Scaffold(
//       appBar: AppBar(),
//       body: 
//       SafeArea(
//         child: Container(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   height: 400,
//                   width: MediaQuery.of(context).size.width/1.1,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.blue.withOpacity(0.5)
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
//                     child: Row(
//                       children: [
//                         Text("New Event",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 17,
//                           fontWeight: FontWeight.w600
//                         ),)
//                       ],
//                     ),
//                   )
                
//                 ),
//                 SizedBox(height: 10,),
//                 // TabBar(
//                 //   indicatorColor: Colors.transparent,
//                 //   unselectedLabelColor: Colors.white,
//                 //   labelColor: Colors.white,
                  
                  
                  
                  
//                 //   tabs: [
//                 //     Container(
//                 //       width: MediaQuery.of(context).size.width/4,
//                 //       height: MediaQuery.of(context).size.height/24,
//                 //       decoration: BoxDecoration(
//                 //         borderRadius: BorderRadius.circular(4),
//                 //         color: Colors.blue,
//                 //       ),
//                 //       child: Tab(
//                 //        // icon: Icon(Icons.person),
//                 //         text: "Month",
//                 //       ),
//                 //     ),
//                 //    Container(
//                 //       width: MediaQuery.of(context).size.width/4,
//                 //       height: MediaQuery.of(context).size.height/24,
//                 //       decoration: BoxDecoration(
//                 //         borderRadius: BorderRadius.circular(4),
//                 //         color: Colors.blue
//                 //       ),
//                 //       child: Tab(
//                 //        // icon: Icon(Icons.person),
//                 //         text: "Week",
//                 //       ),
//                 //     ),
                  
//                 //     Container(
//                 //       width: MediaQuery.of(context).size.width/4,
//                 //       height: MediaQuery.of(context).size.height/24,
//                 //       decoration: BoxDecoration(
//                 //         borderRadius: BorderRadius.circular(4),
//                 //         color: Colors.blue
//                 //       ),
//                 //       child: Tab(
//                 //        // icon: Icon(Icons.person),
//                 //         text: "Day",
//                 //       ),
//                 //     ),
                  
                   
//                 //   ],
//                 //   controller: _tabController,
//                 //   indicatorSize: TabBarIndicatorSize.tab,
//                 // ),
                
                
//                 // Expan(
//                   //child:
//                    TabBarView(
//                     children: [
//                       SfCalendar(
//                         view: CalendarView.month,
//                       ),
//                       SfCalendar(
//                         view: CalendarView.week,
//                       ),
//                        SfCalendar(
//                         view: CalendarView.day,
//                       )
                      
                      
//                     ],
//                     controller: _tabController,
                  
//                   ),
//                 //),
//               ],
//             ),
//           ),
//         ),
      
//       ),
//     );
//   }
// }