import 'package:flutter/material.dart';
import 'package:my_note/Login.dart';
import 'package:my_note/Home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha Nota',
      theme: ThemeData(
        backgroundColor: Colors.grey.shade100,
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => Login(),
        'home': (context) => Home(),
      },
    ),
  );
}
