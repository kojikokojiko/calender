import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'add_schedule_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:stv_calender/model/myprovider.dart';
import 'radd_schedule_page.dart';
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

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    setdaylist(diff_day, day);
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
                        Text(DateFormat("yyyy/MM/dd (E)",'ja').format(selecting_day),
                            style: TextStyle(fontSize: 20)),
                        TextButton(
                            child: Icon(Icons.add),
                            onPressed: () {
                              ref.read(selectDayProbvider.state).update((state)=>selecting_day);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => rAddSchedulePage(),
                                  ));
                            }),
                      ],
                    ),
                    Divider(color: Colors.black),
                    Center(child: Text("予定はありません")),
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
