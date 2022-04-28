import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stv_calender/model/myprovider.dart';

import 'package:stv_calender/model/db/scheduledb.dart';
class TitleForm extends ConsumerWidget {
  TitleForm({this.isEditing,this.todo});
  bool? isEditing;
  Todo? todo;
  String? _title;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return TextFormField(
      initialValue: (isEditing!)?todo!.title:null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
        hintText: "タイトル",

      ),

      onChanged: (value){
        ref.read(titleProvider.state).update((state) => value);
        print(value);
        print(_title);
      },
    );
  }
}
