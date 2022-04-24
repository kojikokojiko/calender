import 'package:flutter/material.dart';

class title_form extends StatelessWidget {
  const title_form({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "タイトル",
        // enabledBorder: OutlineInputBorder(
        //   borderRadius:BorderRadius.circular(10),
        //   borderSide: BorderSide(
        //     color: Colors.blue
        //   )
        // )
      ),
    );
  }
}
