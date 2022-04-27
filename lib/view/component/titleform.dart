import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stv_calender/model/myprovider.dart';

class title_form extends ConsumerWidget {

  String? _title;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
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
