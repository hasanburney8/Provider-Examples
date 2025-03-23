import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_projects/provider/example_2_theme_provider.dart';
import 'package:provider_projects/provider/example_3_todo_list_provider.dart';
import 'package:provider_projects/provider/example_4_cart_provider.dart';
import 'package:provider_projects/provider/example_5_api_provider.dart';
import 'package:provider_projects/provider/example_6_expense_tracker_provider.dart';
import 'package:provider_projects/provider/example_7_habit_list_provider.dart';
import 'package:provider_projects/provider/example_8_voting_provider.dart';
import 'package:provider_projects/screens/example_5_api_provider_screen.dart';
import 'package:provider_projects/screens/example_6_expense_tracker_screen.dart';
import 'package:provider_projects/screens/example_7_habit_list.dart';
import 'package:provider_projects/screens/example_8_voting_provider_screen.dart';
import 'provider/example_1_counter_provider.dart';

void main() {
  debugPrint = (String? message, {int? wrapWidth}) {}; // Disables all debug logs
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => TodoListProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => ApiProvider()),
        ChangeNotifierProvider(create: (context) => ExpenseTrackerProvider()),
        ChangeNotifierProvider(create: (context) => HabitListProvider()),
        ChangeNotifierProvider(create: (context) => VotingProvider()),
      ],
      child: Builder(builder: (BuildContext context){
        final themeChanger = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.red,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.purple,
            primaryColor: Colors.purple,
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.teal
            ),
            iconTheme: IconThemeData(
                color: Colors.pink
            )
          ),
          home: VotingScreen(),
        );
      }),
    );
  }
}

