import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Components/theme.dart';
import 'package:newsapp/Screens/HomeScreen/home_screen.dart';

//6fc5e4ef604c4acfaaa62e359b5ddfe9
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: const HomeScreen(),
    );
  }
}
