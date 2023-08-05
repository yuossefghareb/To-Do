import 'dart:ffi';

import 'package:flutter/material.dart';
import 'my_button.dart';
class MyDilog extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   MyDilog({required this.controller,required this.onCancel,required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Dilog title'),
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller ,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add New Task'
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'Save', onPressed: onSave),
                SizedBox(
                  width: 10,
                ),
                MyButton(text: 'Close', onPressed: onCancel)
              ],
            )
          ],
        ),


      ),
    );
  }
}
