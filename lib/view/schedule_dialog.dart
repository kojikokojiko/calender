import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleDialog extends StatelessWidget {
  ScheduleDialog({this.day});
  final DateTime? day;
  final diff_day=2;
  @override
  Widget build(BuildContext context) {
    List<Widget> _textday=[];
    for (int i =diff_day;i>0;i--){
      var insertday=day!.add(Duration(days: i)*-1);
      _textday.add(Text(DateFormat("yyyy/MM/dd(E)").format(insertday)));
    }
    _textday.add(Text(DateFormat("yyyy/MM/dd(E)").format(day!)));
    for (int i =1;i<diff_day+1;i++){
      var insertday=day!.add(Duration(days: i));
      _textday.add(Text(DateFormat("yyyy/MM/dd(E)").format(insertday)));
    }
    return AlertDialog(
      // title: Text(
      //     '第一問目$day',
      //     textAlign: TextAlign.center),
      content: Container(
        child: PageView(
          controller: PageController(
            initialPage:diff_day

          ),
          children: _textday
        ),
      ),
    );
  }
}
