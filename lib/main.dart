import 'package:flutter/material.dart';
import 'package:my_app/counter.dart';
import 'package:my_app/counter_provider.dart';
import 'package:my_app/wallpapers/wallpaper.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [  //Firstly I have used Provider in void main but then after trying it in context my app runs perfectly.
    ChangeNotifierProvider<CounterProvider>(
      create: (context) => CounterProvider(),
    ),
  ], child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CounterPage()
    ));
  }
}

