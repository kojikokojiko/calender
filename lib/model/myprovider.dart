import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:stv_calender/model/db/scheduledb.dart';



final StateProvider <DateTime>selectDayProbvider=StateProvider((ref){
  return DateTime.now();
});




final StateProvider <DateTime>scheuleStartTimeProvider=StateProvider((ref){
  return DateTime.now();
});

final StateProvider <DateTime>scheduleEndTimeProvider=StateProvider((ref){
  return DateTime.now();
});


final StateProvider <bool>isAlldayProvider=StateProvider((ref){
  return false;
});

final StateProvider <String>titleProvider=StateProvider((ref){
  return "title";
});



final StateProvider <String>contentProvider=StateProvider((ref){
  return "content";
});


final StateProvider <MyDatabase>myDatabaseProvider=StateProvider((ref){
  return MyDatabase();
});

