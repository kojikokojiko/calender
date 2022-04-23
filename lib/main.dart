import 'package:flutter/material.dart';
import 'package:stv_calender/view/calender_screen.dart';
import 'package:intl/date_symbol_data_local.dart'; // 追加
import "package:intl/intl.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
void main() {
  runApp(
      ProviderScope(
        child:stvCalender()
      )
  );
}
class stvCalender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale="ja_JP";
    // 初期化のためのメソッドを追加
    initializeDateFormatting('ja');
    //
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     // body1: TextStyle(color: Colors.black54),
      //   ),
      // ),
      home: CalenderScreen(),
    );
  }
}