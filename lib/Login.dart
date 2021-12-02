import 'package:flutter/material.dart';
import 'package:my_note/components/SecundaryButton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var textEmail = TextEditingController();
  var textPassword = TextEditingController();

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
              Container(
                height: 100,
                child: TextFormField(
                  controller: textEmail,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                      fontSize: 14,
                    ),
                    focusColor: Colors.teal.shade900,
                  ),
                ),
              ),
              Container(
                height: 100,
                child: TextFormField(
                  controller: textPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      fontSize: 14,
                    ),
                    focusColor: Colors.teal.shade900,
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  child: Text('Esqueceu a senha'),
                  style: TextButton.styleFrom(),
                  onPressed: () {},
                ),
              ),
              Container(
                  height: 70,
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox.expand(
                    child: (ElevatedButton(
                      child: Text('Login'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal.shade900,
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        login(textEmail.text, textPassword.text);
                      },
                    )),
                  )),
              secundaryButton('Cadastre-se', 'cadastrar')
            ],
          )),
    );
  }

  void login(email, password) {
    var message = '';
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.pushNamed(context, 'home'))
        .catchError((err) {
      if (err.code == 'user-not-found' ||
          err.code == 'invalid-email' ||
          err.code == 'wrong-password') {
        message =
            'Usuário não encontrado!! Verifique os dados ou faça o cadastro.';
      } else {
        message = err.code;
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red.shade900,
      ));
    });
  }
}
