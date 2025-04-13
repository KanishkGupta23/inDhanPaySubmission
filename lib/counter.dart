import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/counter_provider.dart';

class CounterPage extends StatelessWidget {
 const CounterPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterProvider>(builder: (context, value, child) {
              return Text("${value.count}", style: TextStyle(fontSize: 16),);
            },),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<CounterProvider>(context, listen: false).add();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}