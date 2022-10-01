import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/tododatabase.dart';
import 'package:to_do_app/util/dialogBox.dart';
import 'package:to_do_app/util/todo_tile.dart';

class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  //

  //reference to hive box
  var box = Hive.box('todo');

  //instance of database
  ToDoDatabase db = ToDoDatabase();

  //init
  @override
  void initState() {
    if (box.get('TodoList') == null) {
      db.initialCreatedData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //check function
  void taskCheck(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //save function
  void onSaved() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //add task function
  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSaved: onSaved,
          onCancelled: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task function
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: AppBar(
          elevation: 0,
          title: const Text(
            'TO DO',
            style: TextStyle(fontSize: 35),
          ),
          centerTitle: true,
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          final toDo = db.toDoList[index];
          return ToDoTile(
            taskName: toDo[0],
            taskCompleted: toDo[1],
            onChanged: (value) => taskCheck(value, index),
            onDelete: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
    );
  }
}
