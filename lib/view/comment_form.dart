import "package:flutter/material.dart";
class CommentForm extends StatelessWidget {
  const CommentForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.all(10),
      child: TextField(
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

