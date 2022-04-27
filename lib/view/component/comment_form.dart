import "package:flutter/material.dart";
import "package:stv_calender/model/myprovider.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
class CommentForm extends ConsumerWidget {


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.all(10),
      child: TextFormField(
        onChanged: (value){
          ref.read(contentProvider.state).update((state) => value);


        },
        // デフォルトで表示される青い下線を削除
        decoration: InputDecoration(
          hintText: "コメントを入力してください",
          border: InputBorder.none,
        ),

        // 改行して複数行入力が可能なように、キーボードに改行ボタンを表示
        keyboardType: TextInputType.multiline,

        // 改行できる行数を無制限に設定
        maxLines: null,
      ),
    );
  }
}

