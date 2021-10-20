import 'package:flutter/material.dart';
import 'package:my_note/components/Input.dart';
import 'package:my_note/components/MainButton.dart';
import 'package:my_note/components/SecundaryButton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/assets/home.png'),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
                    Text(
                      'Bem vindo ao',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Minha nota',
                      style:
                          TextStyle(fontSize: 48, color: Colors.teal.shade900),
                    ),
                  ],
                ),
              ),
              TextInput('Usuário'),
              PasswordInput('Senha'),
              Container(
                child: TextButton(
                  child: Text('Esqueceu a senha'),
                  style: TextButton.styleFrom(),
                  onPressed: () {},
                ),
              ),
              MainButton('Login', 'home'),
              secundaryButton('Cadastre-se')
            ],
          )),
    );
  }
}
