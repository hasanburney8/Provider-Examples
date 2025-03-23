import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/example_7_habit_list_provider.dart';

class HabitListScreen extends StatelessWidget {
  const HabitListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final habitListProvider = Provider.of<HabitListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Habit Tracker"),
        actions: [
          IconButton(
              onPressed: (){
                Provider.of<HabitListProvider>(context, listen: false).resetHabits();
              },
              icon: Icon(Icons.refresh),
          )
        ],
      ),


      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Daily Progress:${habitListProvider.completedHabits}/${habitListProvider.totalHabits} habits completed',style: TextStyle(fontSize: 16),),
                SizedBox(height: 8,),
                LinearProgressIndicator(
                  value: habitListProvider.totalHabits>0
                  ? habitListProvider.completedHabits/habitListProvider.totalHabits
                  : 0,
                ),
                SizedBox(height: 8,),
                Text('Completion Percentage: ${habitListProvider.completionPercentage.toStringAsFixed(1)}%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              ],
            ),
          ),

          // Habit List Section
          Expanded(
              child: ListView.builder(
                  itemCount: habitListProvider.habits.length,
                  itemBuilder: (context, index){
                    final habit = habitListProvider.habits[index];
                    return GestureDetector(
                      onLongPress: (){
                        habitListProvider.removeHabit(habit.id);
                      },
                      child: ListTile(
                        title: Text(habit.title),
                        trailing: Checkbox(
                            value: habit.isCompleted,
                            onChanged: (_){
                              habitListProvider.toggleHabit(habit.id);
                            }),
                      ),
                    );
                  }
              )
          )
        ],
      ),

      //Floating action button to add new habits
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                String newHabitTitle = '';
                return AlertDialog(
                  title: const Text('Add Habit'),
                  content: TextField(
                    onChanged: (value) => newHabitTitle = value,
                    decoration: const InputDecoration(hintText: 'Habit Title'),
                  ),
                  actions: [
                    TextButton(
                        onPressed: (){Navigator.of(context).pop();},
                        child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: (){
                        if(newHabitTitle.isNotEmpty){
                          habitListProvider.addHabit(newHabitTitle);
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              },
          );
        },
      ),
    );
  }
}
