import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:stv_calender/model/db/scheduledb.dart';
import 'package:stv_calender/model/myprovider.dart';
import 'package:stv_calender/view/component/shcedule_time.dart';
import 'component/bottom_date_picker.dart';
import 'component/titleform.dart';
import 'component/comment_form.dart';
import 'component/time_checker.dart';

class rEditSchedulePage extends ConsumerWidget {
  rEditSchedulePage({this.todo});
  Todo? todo;
  bool _active = false;
  DateTime? start_day = DateTime.now();
  DateTime? end_day = DateTime.now().add(Duration(hours: 1));
  bool _allday = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    MyDatabase database = ref.watch(myDatabaseProvider);
    DateTime startdate = ref.watch(startTimeProvider);
    DateTime enddate = ref.watch(endTimeProvider);
    WidgetsBinding.instance!.addPostFrameCallback((_) =>ref.read(startTimeProvider.state).update((state) => todo!.startDate!));
    WidgetsBinding.instance!.addPostFrameCallback((_) =>ref.read(endTimeProvider.state).update((state) => todo!.endDate!));


    String title = ref.watch(titleProvider);
    String content = ref.watch(contentProvider);
    final isAllday = ref.watch(isAlldayProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("予定の編集"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return CupertinoActionSheet(
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      child: Text("編集を破棄"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();

                      },
                    ),
                  ],
                  cancelButton: CupertinoButton(
                    child: Text("キャンセル"),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                );
              },
            );
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
                onPressed: () async {
                  await database.updateTodo(
                    todo!,
                    title,
                    content,
                    startdate,
                    enddate,
                    isAllday,
                    false,
                  );
                },
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                child: Text("保存",
                    style: TextStyle(
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
              TitleForm(isEditing: true,todo: todo,),
              ScheduleTime(isEditing: true,todo: todo,),
              CommentForm(isEditing: true,todo: todo,),
              Container(
                width: double.infinity,

                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: Colors.red, backgroundColor: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text("この予定を削除"),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => CupertinoAlertDialog(
                              title: Text("予定の削除"),
                              content: Text("本当にこの日の予定を削除しますか？"),
                              actions: [
                                CupertinoDialogAction(
                                    child: Text("キャンセル"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                                CupertinoDialogAction(
                                    child: Text("削除"),
                                    onPressed: () {
                                      // データを消す処理を実行
                                      database.deleteTodo(todo!);
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    })
                              ],
                            ));
                  },
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
