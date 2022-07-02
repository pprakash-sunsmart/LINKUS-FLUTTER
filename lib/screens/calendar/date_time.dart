
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';


class CalenderWidget extends StatefulWidget {
  dynamic firstDate;
  dynamic LastDate;
  dynamic hintText;


   CalenderWidget({Key? key,
 this.firstDate, this.LastDate,this.hintText}) : super(key: key);

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
   DateTime? _selectedDate;
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: DateTimePicker(
        
        
  firstDate:widget.firstDate,
  
 
          type: DateTimePickerType.dateTime,
           dateMask: 'd MMMM, yyyy - hh:mm a',
          decoration: InputDecoration(
            
            
            suffixIcon: Icon(
              Icons.calendar_month,
              color: Colors.black54,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
           enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  )),
            hintText:widget.hintText,
          ),
          initialDate: DateTime.now(),
         
          lastDate: widget.LastDate,
          validator: (value) {
            return null;
          },
          onChanged: (value) {
            if (value.isNotEmpty) {
              setState(() {
                _selectedDate = value as DateTime;
              });
              
            }
          },
        //  selectableDayPredicate: (date) {
      // Disable weekend days to select from the calendar
   // if () || date.isBefore(DateTime.now()) ) {
  //return false;
//}
//return true;
//          },
       // We can also use onSaved
          onSaved: (value) {
            if (value!=null) {
              _selectedDate = value as DateTime;

              // SizedBox(height: 16),
              Text(
                'Your Selected Date: $_selectedDate',
                style: TextStyle(fontSize: 16),
              );
            
            };
          
      }),
    );
  }
}