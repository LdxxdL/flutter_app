import 'package:flutter/material.dart';

Future<void> showBaseDialog(String title, String content) async {
  await showDialog(
      context: null,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text("确定"),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框
            ),
          ],
        );
      });
}
