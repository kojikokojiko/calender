import 'package:flutter/material.dart';



class ScheduleDialog extends StatelessWidget {
  ScheduleDialog({this.day});
   final DateTime? day;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text(
      //     '第一問目$day',
      //     textAlign: TextAlign.center),
      content:Container(
        height: 400,
        width: 1000,
        child:Text("efe")
      )
    );
  }
}

