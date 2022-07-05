import 'package:flutter/material.dart';

import '../../main.dart';
import '../Login Files/login_textfield.dart';
import '../calendar/date_time.dart';
import 'milestone_model.dart';

class ProjectMilestone extends StatefulWidget {
  const ProjectMilestone({Key? key}) : super(key: key);

  @override
  State<ProjectMilestone> createState() => _ProjectMilestoneState();
}

class _ProjectMilestoneState extends State<ProjectMilestone> {
  final TextEditingController firstNameController = TextEditingController();
  List<Module> module = [];
  int numberOfModule = 0;
  var projectname = TextEditingController();
  var projectid = TextEditingController();
  var modulname = TextEditingController();
  var description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
  onWillPop: ()async => false,
      child: Container(
          child: 
         Column(children: [
                Card(
            color: Colors.grey.shade300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Project Name",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  MasterTextField(
                      hintText: "",
                      Controller: projectname,
                      PrefixIcon: null,
                      enabledborder: const OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black45),
                      ),
                      focusedborder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black45),
                      ),
                      fillColor: null,
                      filled: false,
                      obscureText: false,
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      keyboardType: null),
                      SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        "Project Id",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "*",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  MasterTextField(
                      hintText: "",
                      Controller: projectid,
                      PrefixIcon: null,
                      enabledborder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black45, width: 1.2),
                      ),
                      focusedborder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black45, width: 1.2),
                      ),
                      fillColor: null,
                      filled: false,
                      obscureText: false,
                      contentPadding: EdgeInsets.symmetric(horizontal: 5),
                      keyboardType: null),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: module.length,
                    itemBuilder: ((context, index) {
                    //  _controllers.add(new TextEditingController());
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, ),
                            child: Row(children: [
                              Text(
                                "Module Name",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ]),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.4,
                                  child: MasterTextField(
                                      hintText: "",
                                      Controller: modulname,
                                      PrefixIcon: null,
                                      enabledborder: const OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.black45),
                                      ),
                                      focusedborder: const OutlineInputBorder(
                                        borderSide:
                                            const BorderSide(color: Colors.black45),
                                      ),
                                      fillColor: null,
                                      filled: false,
                                      obscureText: false,
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      keyboardType: null)),
                                      SizedBox(width: 10,),
                              InkWell(
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.red,
                                  ),
                                child:  Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 18,
                                      ),),
                                
                                      onTap: () {
                                        setState(() {
                                          module.removeAt(index);
                                        });
                                      },
                                     
                                
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 40),
                            child: Row(children: [
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "*",
                                style: TextStyle(color: Colors.red),
                              ),
                            ]),
                          ),
                          MasterTextField(
                              hintText: "",
                              Controller:description,
                              PrefixIcon: null,
                              enabledborder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black45),
                              ),
                              focusedborder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black45),
                              ),
                              fillColor: null,
                              filled: false,
                              obscureText: false,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              keyboardType: null),
                              SizedBox(height: 5,),
                          Row(children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Start Date",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                     SizedBox(
                              width: 5,
                            ),
                            Text(
                              "*",
                              style: TextStyle(color: Colors.red),
                            ),
                                  ],
                                ),
                               SizedBox(
                          width: MediaQuery.of(context).size.width /2.5,
                          height: 30,
                          child: CalenderWidget(
                              enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black45),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black45),
                              ),
                              hintText: "",
                              firstDate: DateTime.now()
                                  .subtract(Duration(days: 365)),
                              LastDate:
                                  DateTime.now().add(Duration(days: 365))),
                          ),
                        
                              ],
                            ),
            SizedBox(width: 5,),                  
            Column(
                          children: [
                            Row(children: [
                            Text(
                              "End Date",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "*",
                              style: TextStyle(color: Colors.red),
                            ),
                          ]),
                            SizedBox(
                             width: MediaQuery.of(context).size.width  /2.5,
                              height: 30,
                              child: CalenderWidget(
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black45),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black45),
                                  ),
                                  hintText: "",
                                  firstDate: DateTime.now()
                                      .subtract(Duration(days: 365)),
                                  LastDate:
                                      DateTime.now().add(Duration(days: 365))),
                            ),
                           
                          ],
                          ),
                        
                           
                          ]),
                          const SizedBox()
                        ],
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 5),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color(0xff0c84b4);
                          }
                          return const Color(0xff0c84b4);
                        },
                      ),
                    ),
                            onPressed: () {
                              numberOfModule++;
                              if (mounted) {
                                setState(() {
                                  module.add(Module(
                                      id: numberOfModule, isAddBtnClick: true));
                                });
                              }
                            },
                            child: const Text("ADD",
                            style: TextStyle(
                            letterSpacing: 1),)),
                            SizedBox(width: 7,),
                        ElevatedButton(onPressed: () {}, 
                    
              
                          style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.green;
                          }
                          return Colors.green;
                        },
                      ),
                    ),
    
                        child: const Text("SUBMIT",
                        style: TextStyle(
                        letterSpacing: 1,
                          color: Colors.black
                        ),)),
                      ],
                    ),
                  )
                ],
              ),
            ),
                )
              ]),
          ),
    );
  }
}
