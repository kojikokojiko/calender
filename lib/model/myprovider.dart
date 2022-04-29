import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:stv_calender/model/db/scheduledb.dart';



// final StateProvider <DateTime>selectDayProvider=StateProvider((ref){
//   return DateTime.now();
// });




final startTimeProvider = StateProvider.autoDispose((ref){
  return DateTime.now();
} );


final endTimeProvider = StateProvider.autoDispose((ref){
  return DateTime.now();

} );



// final StateProvider <bool>isAlldayProvider=StateProvider((ref){
//   return false;
// });


final isAlldayProvider = StateProvider.autoDispose<bool>((ref){
  return false;

} );
//
// final StateProvider <String>titleProvider=StateProvider((ref){
//   return "title";
// });
final titleProvider = StateProvider.autoDispose<String>((ref){
  return "title";

} );

final contentProvider = StateProvider.autoDispose<String>((ref){
  return "content";

} );


// final StateProvider <String>contentProvider=StateProvider((ref){
//   return "content";
// });


final StateProvider <MyDatabase>myDatabaseProvider=StateProvider((ref){
  return MyDatabase();
});

