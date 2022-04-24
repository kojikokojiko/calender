import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';



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



