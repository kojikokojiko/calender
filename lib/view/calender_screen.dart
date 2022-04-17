import 'package:flutter/material.dart';
import "package:table_calendar/table_calendar.dart";
import "package:intl/intl.dart";
import "color.dart";
import "package:stv_calender/view/schedule_dialog.dart";

import 'package:month_picker_dialog/month_picker_dialog.dart';

class CalenderScreen extends StatefulWidget {
  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

DateTime? selectedDate;

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay; //追記
  CalendarFormat _calendarFormat = CalendarFormat.month;

  Color _textColor(DateTime day) {
    const _defaultTextColor = Colors.black87;

    if (day.weekday == DateTime.sunday) {
      return Colors.red;
    }
    if (day.weekday == DateTime.saturday) {
      return Colors.blue[600]!;
    }
    return _defaultTextColor;
  }

//  月ピッカー
//   DateTime date = DateTime.now();
  selectDate(BuildContext context) async {
    // 1年前から1年後の範囲でカレンダーから日付を選択します。
    var selectedDate = await showMonthPicker(
      context: context,
      initialDate: this._focusedDay,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    // 選択がキャンセルされた場合はNULL
    if (selectedDate == null) return;

    // 選択されて日付で更新
    this.setState(() {
      this._focusedDay = selectedDate;
    });
  }

  /////////////////////
  @override
  Widget build(BuildContext context) {

    void _showDialog(BuildContext context,day) {
      showDialog(
        context: context,
        builder: (context) {
          return ScheduleDialog(day: day);
            const AlertDialog(
            content: Text('真ん中に出てくるやつ'), // <= ここでダイアログに表示したいWidgetを返してあげればOK
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("カレンダー"),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TableCalendar(
              // eventLoader: ,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              daysOfWeekStyle: DaysOfWeekStyle(
                  decoration: BoxDecoration(
                color: Colors.black12,
              )),
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                formatButtonShowsNext: false,
                leftChevronVisible: false,
                rightChevronVisible: false,
              ),
              // onDaySelected:OnDaySelected(_),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                //以下追記部分
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  _showDialog(context,focusedDay);
                  setState(() {
                    // _showDialog(context);
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              calendarStyle: CalendarStyle(
                  disabledTextStyle: TextStyle(color: Color(0xFFDCDCDC))),
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (BuildContext context, DateTime day) {
                  return Row(
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                          side: const BorderSide(color: Colors.black12),
                        ),
                        onPressed: () {},
                        child: Text(
                          "今日",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 60),
                      Text(
                        "${day.year}年${day.month}月",
                        style: TextStyle(fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () => this.selectDate(context),
                        child: Icon(Icons.arrow_drop_down_sharp),
                      )
                      // Text()
                    ],
                  );
                },

                defaultBuilder:
                    (BuildContext context, DateTime day, DateTime focusedDay) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(
                        color: _textColor(day),
                      ),
                    ),
                  );
                },
                dowBuilder: (context, day) {
                  final text = DateFormat.E().format(day);

                  return Container(
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(color: _textColor(day)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.42,
              decoration: BoxDecoration(color: Colors.black12),
            )
          ],
        ));
  }
}
