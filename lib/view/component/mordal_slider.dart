import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'package:stv_calender/model/db/scheduledb.dart';
import '../add_schedule_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:stv_calender/model/myprovider.dart';
import '../radd_schedule_page.dart';
import 'schedule_card.dart';

class modalSlider extends ConsumerWidget {
  modalSlider({this.day});

  final DateTime? day;
  final diff_day = 2;

  List<DateTime> day_list = [];

  void setdaylist(diffDay, day) {
    day_list.clear();
    for (int i = diffDay; i > 0; i--) {
      var insertday = day!.add(Duration(days: i) * -1);
      day_list.add(insertday);
    }
    day_list.add(day!);
    for (int i = 1; i < diffDay + 1; i++) {
      var insertday = day!.add(Duration(days: i));
      day_list.add(insertday);
    }
  }

  AsyncSnapshot<List<Todo>>  SameDate(AsyncSnapshot<List<Todo>> snapshot, DateTime b,DateTime selecting_day) {
    AsyncSnapshot<List<Todo>>  sameday_snap=AsyncSnapshot.withData(ConnectionState.active,snapshot.data!.where((element) => element.startDate==selecting_day).toList());
    return sameday_snap;
  }

  bool isSameDate(DateTime a,DateTime b){
    if(a.year==b.year&&a.month==b.month&&a.day==b.day){
      return true;
    }else{
      return false;
    }
  }


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyDatabase database = ref.watch(myDatabaseProvider);
    setdaylist(diff_day, day);
    // MyDatabase data=ref.watch(myDatabaseProvider);
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        height: 550,
        viewportFraction: 0.8,
        initialPage: diff_day,
        enableInfiniteScroll: false,
      ),
      items: day_list.map((selecting_day) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),

              margin: EdgeInsets.only(bottom: 40, left: 10, right: 10),
              // color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Text(day.toString()),
                        Text(
                            DateFormat("yyyy/MM/dd (E)", 'ja')
                                .format(selecting_day),
                            style: TextStyle(fontSize: 20)),
                        TextButton(
                            child: Icon(Icons.add),
                            onPressed: () {
                              ref
                                  .read(selectDayProbvider.state)
                                  .update((state) => selecting_day);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => rAddSchedulePage(),
                                  ));
                            }),
                      ],
                    ),
                    Expanded(
                      //10
                      //以下、Container()をStreamBuilder(...)に置き換え
                      child: StreamBuilder(
                        stream: database.watchSamedayEntries(selecting_day),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Todo>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return (snapshot.data!.length==0)?Center(child: Text("予定がありません")):ListView.builder(
                              //11
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) =>
                                  ScheduleCard(
                                      snapshot: snapshot,
                                      index: index,
                                    )
                            //     Visibility(
                            //   visible: isSameDate(
                            //       snapshot.data![index].startDate!,
                            //       selecting_day),
                            //   child: ScheduleCard(
                            //     snapshot: snapshot,
                            //     index: index,
                            //   ),
                            // ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
