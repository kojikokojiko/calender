import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stv_calender/model/db/scheduledb.dart';
class ScheduleCard extends StatelessWidget {
  ScheduleCard({this.snapshot,this.index});

  AsyncSnapshot<List<Todo>>? snapshot;
  int? index;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Divider(color: Colors.black,),
          Container(
            child: TextButton(
              onPressed: (){},
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.black)

              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spac,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Text(DateFormat("HH:mm").format(snapshot!.data![index!].startDate!)),
                      Text(DateFormat("HH:mm").format(snapshot!.data![index!].endDate!)),
                    ],
                  ),
                  VerticalDivider(color: Colors.red,thickness: 10,),
                  Text(snapshot!.data![index!].title),
                  Text(snapshot!.data![index!].content),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
