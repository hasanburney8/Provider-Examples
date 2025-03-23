import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_projects/provider/example_2_theme_provider.dart';

class DarkProviderScreen extends StatefulWidget {
  const DarkProviderScreen({super.key});

  @override
  State<DarkProviderScreen> createState() => _DarkProviderScreenState();
}

class _DarkProviderScreenState extends State<DarkProviderScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribe'),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              title: Text("Light Mode"),
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme
          ),
          RadioListTile<ThemeMode>(
              title: Text("Dark Mode"),
              value: ThemeMode.dark,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme
          ),
          RadioListTile<ThemeMode>(
              title: Text("System Mode"),
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme
          ),
        ],
      ),
    );
  }
}



// class ThemeProviderScreen extends StatefulWidget {
//   const ThemeProviderScreen({super.key});
//
//   @override
//   State<ThemeProviderScreen> createState() => _ThemeProviderScreenState();
// }
//
// class _ThemeProviderScreenState extends State<ThemeProviderScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final themeChanger = Provider.of<ThemeProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Theme Changer'),
//       ),
//       body: Column(
//         children: [
//           RadioListTile<ThemeMode>(
//               title: Text("Light Mode"),
//               value: ThemeMode.light,
//               groupValue: themeChanger.themeMode,
//               onChanged: themeChanger.setTheme
//           ),
//           RadioListTile<ThemeMode>(
//               title: Text("Dark Mode"),
//               value: ThemeMode.dark,
//               groupValue: themeChanger.themeMode,
//               onChanged: themeChanger.setTheme
//           ),
//           RadioListTile<ThemeMode>(
//               title: Text("System Mode"),
//               value: ThemeMode.system,
//               groupValue: themeChanger.themeMode,
//               onChanged: themeChanger.setTheme
//           ),
//         ],
//       ),
//     );
//   }
// }
