import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/example_3_todo_list_provider.dart';

class TodoListProviderScreen extends StatefulWidget {
  const TodoListProviderScreen({super.key});

  @override
  State<TodoListProviderScreen> createState() => _TodoListProviderScreenState();
}

class _TodoListProviderScreenState extends State<TodoListProviderScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final todoListProvider = Provider.of<TodoListProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text("Todo List Provider")),
      body: Column(
        children: [



          TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter Task",
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      todoListProvider.addTask(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              )
          ),


          Expanded(
            child: Consumer<TodoListProvider>(
              builder: (context, provider, child){
                return ListView.builder(
                  itemCount: provider.tasks.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(provider.tasks[index]),
                      trailing: IconButton(
                        onPressed: () => provider.removeTask(index),
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





//import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// import '../provider/example_3_todo_list_provider.dart';
//
// class TodoListProviderScreen extends StatefulWidget {
//   const TodoListProviderScreen({super.key});
//
//   @override
//   State<TodoListProviderScreen> createState() => _TodoListProviderScreenState();
// }
//
// class _TodoListProviderScreenState extends State<TodoListProviderScreen> {
//   final TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//
//     final todoListProvider = Provider.of<TodoListProvider>(context, listen: false);
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Todo List Provider")),
//       body: Column(
//         children: [
//
//
//
//           TextField(
//             controller: _controller,
//             style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
//             decoration: InputDecoration(
//               hintText: "Enter a new task...",
//               hintStyle: GoogleFonts.poppins(color: Colors.black54),
//               filled: true,
//               fillColor: Colors.white,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide.none,
//               ),
//               suffixIcon: Container(
//                 margin: EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   color: Colors.blueAccent,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: IconButton(
//                   icon: Icon(Icons.add, color: Colors.white),
//                   onPressed: () {
//                     if (_controller.text.isNotEmpty) {
//                       todoListProvider.addTask(_controller.text);
//                       _controller.clear();
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),
//
//
//           Expanded(
//             child: Consumer<TodoListProvider>(
//               builder: (context, provider, child) {
//                 return ListView.builder(
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   itemCount: provider.tasks.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 8.0),
//                       child: Card(
//                         elevation: 4,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: ListTile(
//                           contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                           title: Text(
//                             provider.tasks[index],
//                             style: GoogleFonts.poppins(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           trailing: IconButton(
//                             onPressed: () => provider.removeTask(index),
//                             icon: const Icon(Icons.delete, color: Colors.redAccent),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }