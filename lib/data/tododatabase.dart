import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  //empty list
  List toDoList = [];

  //reference to box
  final boxx = Hive.box('todo');

  //initial data when todo app is emtpy
  void initialCreatedData() {
    toDoList = [
      ['Code an App', false],
      ['Write up', false],
    ];
  }

  //loading data from db
  void loadData() {
    toDoList = boxx.get('TodoList');
  }

  //updating data to db
  void updateData() {
    boxx.put('TodoList', toDoList);
  }
}
