import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stv_calender/model/myprovider.dart';
class TimeChecker extends ConsumerWidget {
  TimeChecker({this.initday,this.allday,this.isstart});
  DateTime? initday;
  bool? allday;
  bool? isstart;
  DateTime? _changedday;
  CupertinoDatePickerMode showmode=CupertinoDatePickerMode.date;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                    color: Color(0xff999999),
                    width: 0.0),
              )),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                child: Text("キャンセル"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                padding:
                const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0),
              ),
              CupertinoButton(
                child: Text("追加"),
                onPressed: () {
                  if (isstart!){
                    // print(_changedday);
                    ref.read(startTimeProvider.state).update((state) => _changedday!);
                    // print(ref.watch(selectDayProvider));
                  }else{
                    print(_changedday);
                    ref.read(endTimeProvider.state).update((state) => _changedday!);
                  }


                  Navigator.of(context).pop();
                },
                padding:
                const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 5.0),
              ),
            ],
          ),
        ),
        Container(
          height:
          MediaQuery
              .of(context)
              .size
              .height /
              3,
          padding:
          const EdgeInsets.only(top: 6.0),
          color: CupertinoColors.white,
          child: DefaultTextStyle(
            style: const TextStyle(
                color: CupertinoColors.black,
                fontSize: 22.0),
            child: GestureDetector(
              onTap: () {},
              child: SafeArea(
                top: false,
                child: CupertinoDatePicker(
                  use24hFormat: true,
                  initialDateTime: initday!,
                  onDateTimeChanged: (value) {
                    _changedday = value;
                    // ref.read(scheduleEndTimeProvider.state).update((state) => value);

                  },
                  mode: allday! ? CupertinoDatePickerMode.date:CupertinoDatePickerMode.dateAndTime,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}





