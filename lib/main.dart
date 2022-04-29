
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Presentation/Screens/home.dart';
import 'Presentation/state_manager.dart';



void main()async  {
  Get.put(StateManager());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubo Reminder',
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor:   Colors.lightBlue.shade800,
        ),
        primaryColor:          Colors.lightBlue.shade800,
        scaffoldBackgroundColor: Colors.lightBlue.shade800,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.lightBlue.shade800,
              centerTitle: true,
              elevation: 0,),

      ),
      home: const HomePage(),
    );
  }
}
