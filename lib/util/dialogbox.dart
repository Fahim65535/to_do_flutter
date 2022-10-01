import 'package:flutter/material.dart';

import 'package:to_do_app/util/mybutton.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSaved;
  final VoidCallback onCancelled;
  const DialogBox({
    Key? key,
    required this.controller,
    required this.onSaved,
    required this.onCancelled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: SizedBox(
        height: 115,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //textField
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
                hintStyle: TextStyle(
                  fontSize: 16,
                  letterSpacing: 0.4,
                ),
              ),
            ),
            const SizedBox(height: 8),
            //buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                Button(text: 'Save', onPressed: onSaved),
                const SizedBox(width: 8),
                //cancel button
                Button(text: 'Cancel', onPressed: onCancelled),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
