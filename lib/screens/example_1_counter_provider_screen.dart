import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/example_1_counter_provider.dart';

class CounterProviderScreen extends StatefulWidget {

  @override
  State<CounterProviderScreen> createState() => _CounterProviderScreenState();
}

class _CounterProviderScreenState extends State<CounterProviderScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context,listen: false);
    print('build');
    return Scaffold(
      appBar: AppBar(
          title: Text("Provider Counter"),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context,provider,child){
            return Text(
              // provider.count.toString(),
              '${provider.count}',
              style: TextStyle(fontSize: 50),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counterProvider.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
