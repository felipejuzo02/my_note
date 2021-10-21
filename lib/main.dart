import 'package:flutter/material.dart';
import 'package:my_note/Atividades.dart';
import 'package:my_note/Cadastrar.dart';
import 'package:my_note/Login.dart';
import 'package:my_note/Home.dart';
import 'package:my_note/Sobre.dart';
import 'package:my_note/Materias.dart';
import 'package:my_note/Notas.dart';
import 'package:my_note/MeuPerfil.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha Nota',
      theme: ThemeData(
        backgroundColor: Colors.grey.shade100,
        textTheme: TextTheme(
          headline2: TextStyle(
            fontSize: 26,
            color: Colors.teal.shade900,
            fontWeight: FontWeight.w600,
          ),
          headline3: TextStyle(
            fontSize: 22,
            color: Colors.teal.shade900,
            fontWeight: FontWeight.w400,
          ),
          subtitle1: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade700,
          ),
        ),
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => Login(),
        'home': (context) => Home(),
        'sobre': (context) => Sobre(),
        'materias': (context) => Materias(),
        'atividades': (context) => Atividades(),
        'notas': (context) => Notas(),
        'meu-perfil': (context) => MeuPerfil(),
        'cadastrar': (context) => Cadastrar()
      },
    ),
  );
}
