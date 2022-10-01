import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(BuildContext)? onDelete;
  final Function(bool?)? onChanged;

  const ToDoTile(
      {Key? key,
      required this.taskName,
      required this.taskCompleted,
      required this.onDelete,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade900,
              foregroundColor: Colors.yellow,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.yellowAccent.shade400,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                blurRadius: 14,
                offset: Offset(5, 7),
              ),
              BoxShadow(
                  blurRadius: 12,
                  offset: Offset(-5, -5),
                  color: Colors.white12),
            ],
          ),
          child: Row(
            children: [
              //check box
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
                autofocus: true,
              ),
              //text
              Text(
                taskName,
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.4,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
