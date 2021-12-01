import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_note/components/CheckBox.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({Key? key}) : super(key: key);

  @override
  _CadastrarState createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  var textName = TextEditingController();
  var textEmail = TextEditingController();
  var textPassword = TextEditingController();
  var textRepeatPassword = TextEditingController();
  var textBirthDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
          padding: EdgeInsets.all(30),
          child: ListView(
            children: [
              Container(
                child: Column(
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
                    Divider(
                      height: 40,
                      thickness: 0.4,
                      color: Colors.teal.shade900,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Text(
                      'Bora lá?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.teal.shade900,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        'Para realizar o cadastro é simples, basta preencher as informações solicitadas abaixo e depois clicar em \'Criar conta\', que seu cadastro estará completo e você pronto pra usar o Aplicativo.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: TextFormField(
                        controller: textName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Nome',
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
                      height: 100,
                      child: TextFormField(
                        controller: textRepeatPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Repita a senha',
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
                        controller: textBirthDate,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Data de nascimento',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          focusColor: Colors.teal.shade900,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CheckBoxWithLabel('Li e concordo com os '),
                        TextButton(
                            onPressed: () {}, child: Text('termos de uso.')),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  height: 70,
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox.expand(
                    child: (ElevatedButton(
                      child: Text('Criar conta'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal.shade900,
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      onPressed: () {
                        createAccount(
                            textName.text,
                            textEmail.text,
                            textPassword.text,
                            textRepeatPassword.text,
                            textBirthDate.text);
                      },
                    )),
                  )),
            ],
          )),
    );
  }

  createAccount(name, email, password, repeatPassword, birthDate) {
    if (name == '' ||
        email == '' ||
        password == '' ||
        repeatPassword == '' ||
        birthDate == '') {
    } else {
      if (password == repeatPassword) {
        FirebaseFirestore.instance.collection('users').add({
          'name': name,
          'email': email,
          'birthDate': birthDate,
          'password': password,
        }).then((value) {});

        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Conta criado com sucesso!!'),
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.green.shade900,
          ));

          Navigator.pushNamed(context, 'home');
        }).catchError((err) {
          if (err.code == 'email-already-in-use') {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('E-mail já está em uso, tente com outro!!'),
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red.shade900,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(err.message),
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red.shade900,
            ));
          }
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('As senhas nao conferem'),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.red.shade900,
        ));
      }
    }
  }
}
