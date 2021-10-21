import 'package:flutter/material.dart';
import 'package:my_note/components/CheckBox.dart';
import 'package:my_note/components/Input.dart';
import 'package:my_note/components/MainButton.dart';

class Cadastrar extends StatelessWidget {
  const Cadastrar({Key? key}) : super(key: key);

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
                    TextInput('Nome'),
                    TextInput('E-mail'),
                    PasswordInput('Senha'),
                    PasswordInput('Confirme sua senha'),
                    TextInput('Data de nascimento'),
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
              MainButton('Criar conta', 'home'),
            ],
          )),
    );
  }
}
