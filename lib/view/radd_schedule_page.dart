import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:stv_calender/model/db/scheduledb.dart';
import 'package:stv_calender/model/myprovider.dart';
import 'package:stv_calender/view/component/shcedule_time.dart';
import 'bottom_date_picker.dart';
import 'component/titleform.dart';
import 'component/comment_form.dart';
import 'component/time_checker.dart';

class rAddSchedulePage extends ConsumerWidget {
  bool _active = false;
  DateTime? start_day = DateTime.now();
  DateTime? end_day = DateTime.now().add(Duration(hours: 1));
  bool _allday=false;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    MyDatabase database=ref.watch(myDatabaseProvider);
    DateTime  startdate=ref.watch(selectDayProbvider);
    DateTime  enddate=ref.watch(scheduleEndTimeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("予定の追加"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //これを追加
        // automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            width: 70,
            height: 20,
            child: ElevatedButton(
                onPressed:()async {
                  await database.addTodo(
                      "ppp",
                      "sss",
                      startdate,
                      enddate,
                      false,
                      false
                  );
                  // ref.read(myDatabaseProvider.state).((state)=>state.addTodo);
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: Text("保存", style: TextStyle(
                    color: Colors.black,

                ))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          // margin: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(children: <Widget>[
              title_form(),
              ScheduleTime(),
              CommentForm(),
              Expanded(
                //10
                //以下、Container()をStreamBuilder(...)に置き換え
                child: StreamBuilder(
                  stream: database.watchEntries(),
                  builder:
                      (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      //11
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => TextButton(
                        child: Text(snapshot.data![index].content),
                        onPressed: () async {
                        },
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
