import 'package:flutter/material.dart';
import 'package:timer_app/src/views/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        ),
        primarySwatch: Colors.red,
      ),
      home: MainView(),
    );
  }
}
