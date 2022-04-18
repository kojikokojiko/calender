import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class modalSlider extends StatelessWidget {
  modalSlider({this.day});
  final DateTime? day;
  final diff_day=2;


  List<DateTime> day_list=[];


  void setdaylist(diffDay,day){
    day_list.clear();
    for (int i =diffDay;i>0;i--){
      var insertday=day!.add(Duration(days: i)*-1);
      day_list.add(insertday);
    }
    day_list.add(day!);
    for (int i =1;i<diffDay+1;i++){
      var insertday=day!.add(Duration(days: i));
      day_list.add(insertday);
    }
  }




  @override
  Widget build(BuildContext context) {
    setdaylist(diff_day, day);
    return CarouselSlider(
      options: CarouselOptions(
          aspectRatio: 2.0,
        height: 550,
        viewportFraction: 0.8,
          initialPage:diff_day,
      ),
      items: day_list.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              
              margin: EdgeInsets.only(bottom: 40,left:10,right: 10),
              // color: Colors.white,
              child: Center(
                child: Text('text $i', style: TextStyle(fontSize: 16.0),),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
