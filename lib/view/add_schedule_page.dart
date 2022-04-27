// import 'package:flutter/cupertino.dart';
// import "package:flutter/material.dart";
// import 'package:intl/intl.dart';
// import 'bottom_date_picker.dart';
//
// class AddSchedulePage extends StatefulWidget {
//   @override
//   State<AddSchedulePage> createState() => _AddSchedulePageState();
// }
//
// class _AddSchedulePageState extends State<AddSchedulePage> {
//   bool _active = false;
//   DateTime? start_day = DateTime.now();
//   DateTime? end_day = DateTime.now().add(Duration(hours: 1));
//
//   showMypicker(DateTime? initialdate) {
//     showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           height: MediaQuery.of(context).size.height / 3,
//           child: CupertinoDatePicker(
//             initialDateTime: initialdate,
//             onDateTimeChanged: (value) {
//               setState(() {
//                 initialdate = value;
//               });
//             },
//             mode: CupertinoDatePickerMode.dateAndTime,
//           ),
//         );
//       },
//     );
//   }
//
//   void _changeSwitch(bool e) => setState(() => _active = e);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("予定の追加"),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.clear),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         //これを追加
//         // automaticallyImplyLeading: false,
//         actions: <Widget>[
//           Container(
//             margin: EdgeInsets.all(10),
//             width: 60,
//             height: 20,
//             child: ElevatedButton(
//                 onPressed: () {},
//                 style: OutlinedButton.styleFrom(
//                     backgroundColor: Colors.grey[300],
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)))),
//                 child: Text("保存", style: TextStyle(color: Colors.black))),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           height: 800,
//           // margin: EdgeInsets.all(10),
//           decoration: BoxDecoration(color: Colors.grey[300]),
//           child: Container(
//             margin: EdgeInsets.all(10),
//             child: Column(children: <Widget>[
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: "タイトル",
//                   // enabledBorder: OutlineInputBorder(
//                   //   borderRadius:BorderRadius.circular(10),
//                   //   borderSide: BorderSide(
//                   //     color: Colors.blue
//                   //   )
//                   // )
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 10, bottom: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 width: double.infinity,
//                 height: 200,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           top: 5.0, bottom: 0, left: 10.0, right: 3.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text("終日"),
//                           Switch(
//                             value: _active,
//                             onChanged: _changeSwitch,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Divider(color: Colors.black),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10.0, right: 3.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text("開始"),
//                           TextButton(
//                             onPressed: () {
//                               showCupertinoModalPopup(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return Column(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             border: Border(
//                                               bottom: BorderSide(
//                                                   color: Color(0xff999999),
//                                                   width: 0.0),
//                                             )),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             CupertinoButton(
//                                               child: Text("キャンセル"),
//                                               onPressed: () {
//                                                 Navigator.of(context).pop();
//                                               },
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 16.0,
//                                                       vertical: 5.0),
//                                             ),
//                                             CupertinoButton(
//                                               child: Text("追加"),
//                                               onPressed: () {
//                                                 setState(() {
//
//                                                 });
//                                                 Navigator.of(context).pop();
//                                               },
//                                               padding:
//                                                   const EdgeInsets.symmetric(
//                                                       horizontal: 16.0,
//                                                       vertical: 5.0),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Container(
//                                         height:
//                                             MediaQuery.of(context).size.height /
//                                                 3,
//                                         padding:
//                                             const EdgeInsets.only(top: 6.0),
//                                         color: CupertinoColors.white,
//                                         child: DefaultTextStyle(
//                                           style: const TextStyle(
//                                               color: CupertinoColors.black,
//                                               fontSize: 22.0),
//                                           child: GestureDetector(
//                                             onTap: () {},
//                                             child: SafeArea(
//                                               top: false,
//                                               child: CupertinoDatePicker(
//                                                 initialDateTime: start_day!,
//                                                 onDateTimeChanged: (value) {
//                                                   // setState(() {
//                                                   start_day = value;
//                                                   // });
//                                                 },
//                                                 mode: CupertinoDatePickerMode
//                                                     .date,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             },
//                             // showMypicker(start_day),
//                             child: Text(
//                               DateFormat("yyyy-MM-dd H:m").format(start_day!),
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     Divider(color: Colors.black),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           bottom: 5.0, left: 10.0, right: 3.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text("終了"),
//                           TextButton(
//                             onPressed: () {
//                               // showMypicker(end_day!);
//                               showCupertinoModalPopup(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return Column(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       Container(
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             border: Border(
//                                               bottom: BorderSide(
//                                                   color: Color(0xff999999),
//                                                   width: 0.0),
//                                             )),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             CupertinoButton(
//                                               child: Text("キャンセル"),
//                                               onPressed: () {
//                                                 Navigator.of(context).pop();
//                                               },
//                                               padding:
//                                               const EdgeInsets.symmetric(
//                                                   horizontal: 16.0,
//                                                   vertical: 5.0),
//                                             ),
//                                             CupertinoButton(
//                                               child: Text("追加"),
//                                               onPressed: () {
//                                                 setState(() {
//
//                                                 });
//                                                 Navigator.of(context).pop();
//                                               },
//                                               padding:
//                                               const EdgeInsets.symmetric(
//                                                   horizontal: 16.0,
//                                                   vertical: 5.0),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Container(
//                                         height:
//                                         MediaQuery.of(context).size.height /
//                                             3,
//                                         padding:
//                                         const EdgeInsets.only(top: 6.0),
//                                         color: CupertinoColors.white,
//                                         child: DefaultTextStyle(
//                                           style: const TextStyle(
//                                               color: CupertinoColors.black,
//                                               fontSize: 22.0),
//                                           child: GestureDetector(
//                                             onTap: () {},
//                                             child: SafeArea(
//                                               top: false,
//                                               child: CupertinoDatePicker(
//                                                 initialDateTime: end_day!,
//                                                 onDateTimeChanged: (value) {
//                                                   // setState(() {
//                                                   end_day = value;
//                                                   // });
//                                                 },
//                                                 mode: CupertinoDatePickerMode
//                                                     .date,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             },
//                             child: Text(
//                               DateFormat("yyyy-MM-dd H:m").format(end_day!),
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 10, bottom: 10),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5)),
//                 width: double.infinity,
//                 height: 200,
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   // デフォルトで表示される青い下線を削除
//                   decoration: InputDecoration(
//                     hintText: "コメントを入力してください",
//                     border: InputBorder.none,
//                   ),
//
//                   // 改行して複数行入力が可能なように、キーボードに改行ボタンを表示
//                   keyboardType: TextInputType.multiline,
//
//                   // 改行できる行数を無制限に設定
//                   maxLines: null,
//                 ),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
