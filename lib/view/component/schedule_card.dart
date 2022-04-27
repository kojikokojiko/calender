import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:stv_calender/model/db/scheduledb.dart';
import 'package:stv_calender/view/r_edit_schedule_page.dart';
import 'package:stv_calender/model/myprovider.dart';
class ScheduleCard extends ConsumerWidget {
  ScheduleCard({this.snapshot,this.index,this.selecting_day});


  AsyncSnapshot<List<Todo>>? snapshot;
  int? index;
  DateTime? selecting_day;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Divider(color: Colors.black,),
          Container(
            child: TextButton(
              onPressed: (){
                ref
                    .read(selectDayProbvider.state)
                    .update((state) => selecting_day!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => rEditSchedulePage(),
                  ),
                );
              },
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
