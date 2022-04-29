import 'package:flutter/material.dart';
import 'package:stv_calender/view/calender_screen.dart';
import 'package:intl/date_symbol_data_local.dart'; // 追加
import "package:intl/intl.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'view/r_calender_screen.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:stv_calender/model/db/scheduledb.dart';
void main() {

  final database =MyDatabase();
  runApp(
      ProviderScope(
        child:MyApp()
      )
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Intl.defaultLocale="ja_JP";
    // 初期化のためのメソッドを追加
    // initializeDateFormatting('ja');
    //
    return MaterialApp(

      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ja'),
      ],
      locale: Locale("ja"),
      home: CalenderScreen(),
    );
  }
}