import 'package:flutter/material.dart';
import 'package:sampledb/screens/notes_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Database',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const NotesScreen(),
    );
  }
}