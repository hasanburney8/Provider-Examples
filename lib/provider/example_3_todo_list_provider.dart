import 'package:flutter/material.dart';

class TodoListProvider extends ChangeNotifier{
  List<String> _tasks = [];

  List<String> get tasks => _tasks;

  void addTask(String task){
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }
}