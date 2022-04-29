import 'package:cubotest/Presentation/Themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Presentation/Screens/home.dart';
import 'Presentation/state_manager.dart';

void main() async {
  Get.put(StateManager());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cubo Reminder',
      theme: AppThemeData.theme,
      home: const HomePage(),
    );
  }
}
