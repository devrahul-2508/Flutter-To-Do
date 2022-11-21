import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/todo.dart';
import 'package:flutter_to_do/pages/addtodo.dart';
import 'package:flutter_to_do/pages/homepage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ToDOAdapter());
   await Hive.openBox<ToDO>('mybox');



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Your TO DO",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
