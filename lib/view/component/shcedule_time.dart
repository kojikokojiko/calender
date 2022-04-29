import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:stv_calender/model/myprovider.dart';
import 'time_checker.dart';
import "package:intl/intl.dart";
import 'package:flutter/cupertino.dart';
import 'package:stv_calender/model/db/scheduledb.dart';
class ScheduleTime extends  ConsumerWidget{


  ScheduleTime({this.isEditing,this.todo});
  bool? isEditing;
  Todo? todo;

  @override
  Widget build(BuildContext context,WidgetRef ref) {



    final startday=ref.watch(selectDayProvider);
    final endday=ref.watch(scheduleEndTimeProvider);
    final isAllday=ref.watch(isAlldayProvider);


    void _changeSwitch(bool e) {
      ref.read(isAlldayProvider.state).update((state) => e);

    };

    return   Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      width: double.infinity,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: 5.0, bottom: 0, left: 10.0, right: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("終日"),
                Switch(
                  value: isAllday,
                  onChanged: _changeSwitch,
                ),
              ],
            ),
          ),
          Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("開始"),
                TextButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return TimeChecker(initday:startday,allday: isAllday,isstart: true,);
                      },
                    );
                  },

                  child: Text(
                    isAllday ? DateFormat("yyyy-MM-dd").format(startday):DateFormat("yyyy-MM-dd HH:mm").format(startday),
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 5.0, left: 10.0, right: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("終了"),
                TextButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return TimeChecker(initday:endday,allday:isAllday,isstart: false,);
                      },
                    );
                  },
                  child: Text(
                    isAllday ? DateFormat("yyyy-MM-dd").format(endday):DateFormat("yyyy-MM-dd H:m").format(endday),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
