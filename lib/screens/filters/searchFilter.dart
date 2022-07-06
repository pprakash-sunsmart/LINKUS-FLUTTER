import 'package:flutter/material.dart';

import '../calendar/date_time.dart';
import '../chatscreen Files/dataList.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Media'),
        ),
        body: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    // height: MediaQuery.of(context).size.height / 2,
                    child: CalenderWidget(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black45),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black26),
                        ),
                        hintText: "",
                        icon: Icons.arrow_drop_down,
                        firstDate: DateTime.now(),
                        LastDate: DateTime.now()),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    // height: MediaQuery.of(context).size.height / 2,
                    child: CalenderWidget(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        hintText: "",
                        icon: Icons.arrow_drop_down,
                        firstDate: DateTime.now(),
                        LastDate: DateTime.now()),
                  ),
                ]),
              ),
              Expanded(
                child: ListView.separated(
                    // shrinkWrap: true,

                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      final employee = Employees[index];
                      return CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        value: employee.isChecked,
                        onChanged: (newValue) {
                          setState(() {
                            employee.isChecked = newValue!;
                          });
                        },
                        title: Text(Employees[index].Name),
                        secondary: CircleAvatar(child: Icon(Icons.person)),
                        subtitle: Text(Employees[index].jobProfile),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider()),
              )
            ],
          ),
        ),
        bottomSheet: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              color: Colors.pink,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    Text(
                      'Show Conversation',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
