import 'package:flutter/material.dart';
import 'package:my_note/Home.dart';
import 'package:my_note/components/Header.dart';
import 'package:my_note/components/ItemsAppBar.dart';
import 'package:my_note/components/MainButton.dart';
import 'package:my_note/components/Input.dart';

class MeuPerfil extends StatefulWidget {
  const MeuPerfil({Key? key}) : super(key: key);

  @override
  _MeuPerfilState createState() => _MeuPerfilState();
}

class _MeuPerfilState extends State<MeuPerfil> {
  var name = profile.name;
  var email = profile.email;
  var password = profile.password;
  var birthDate = profile.birthDate;
  var nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha nota'),
        backgroundColor: Colors.teal.shade900,
      ),
      drawer: Drawer(
        child: ItemsAppBar(),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Header(
              'Meu perfil',
              'Consulte ou altere suas informações.',
            ),
            Column(
              children: [
                Container(
                  width: 190,
                  height: 190,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.teal.shade900),
                    image: DecorationImage(
                        image: AssetImage('lib/assets/silhueta.png')),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 150,
                  child: TextButton(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.photo,
                            color: Colors.teal.shade900,
                          ),
                        ),
                        Text(
                          'Alterar Foto',
                          style: TextStyle(color: Colors.teal.shade900),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Center(
                  child: Card(
                    child: ListTile(
                      title: Text('Nome'),
                      subtitle: Text(name),
                      trailing: IconButton(
                        onPressed: () {
                          EditarInfosModal('Editar nome:', 'Nome');
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    child: ListTile(
                      title: Text('E-mail'),
                      subtitle: Text(email),
                      trailing: IconButton(
                        onPressed: () {
                          EditarInfosModal('Editar e-mail:', 'E-mail');
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    child: ListTile(
                      title: Text('Senha'),
                      subtitle: Text(password),
                      trailing: IconButton(
                        onPressed: () {
                          EditarInfosModal('Editar senha:', 'Senha');
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Card(
                    child: ListTile(
                      title: Text('Data nascimento'),
                      subtitle: Text(birthDate),
                      trailing: IconButton(
                        onPressed: () {
                          EditarInfosModal(
                              'Editar data de nascimento:', 'Data nascimento');
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: MainButton('Salvar', 'home'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  EditarInfosModal(title, label) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  TextInput(label),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10.0),
                  primary: Colors.red.shade900,
                  textStyle: TextStyle(fontSize: 14),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Salvar'),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10.0),
                  primary: Colors.white,
                  backgroundColor: Colors.teal.shade900,
                  textStyle: TextStyle(fontSize: 14),
                ),
              ),
            ],
          );
        });
  }
}
