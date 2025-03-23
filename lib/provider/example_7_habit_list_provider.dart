import 'package:flutter/material.dart';

import '../model/example_7_habit_tracker_model.dart';

class HabitListProvider with ChangeNotifier{
   final List<Habit> _habits = [];
   List<Habit> get habits => _habits;
   int get totalHabits => _habits.length;

   //getter to calculate how many habits have been completed
  int get completedHabits => _habits.where((habit) => habit.isCompleted).length;

  //Calculate percentage
  double get completionPercentage{
    if(totalHabits == 0) return 0;
    return (completedHabits/totalHabits) * 100;
  }

  // method to add a new habitat
  void addHabit(String title){
    final newHabit = Habit(
      id: DateTime.now().toString(),
      title: title,
    );
    _habits.add(newHabit);
    notifyListeners();
  }

  // method to toggle
  void toggleHabit(String id){
    final index = _habits.indexWhere((habit) => habit.id == id);
    if(index != -1){
      _habits[index].isCompleted = !_habits[index].isCompleted ;
      notifyListeners();
    }
  }

// to reset
  void resetHabits(){
    for(var habit in _habits){
      habit.isCompleted = false;
    }
    notifyListeners();
  }


  //delete a habit
  void removeHabit(String id){
    _habits.removeWhere((habit) => habit.id == id);
    notifyListeners();
  }
}