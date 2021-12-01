import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  var nameController = TextEditingController();
  var birthDateController = TextEditingController();
  var email = FirebaseAuth.instance.currentUser?.email;

  late CollectionReference users;

  @override
  void initState() {
    super.initState();
    users = FirebaseFirestore.instance.collection('users');
  }

  Widget ShowInformations(item) {
    String name = item.data()['name'];
    String email = item.data()['email'];
    String password = item.data()['password'];
    String birthDate = item.data()['birthDate'];

    return Column(
      children: [
        Center(
          child: Card(
            child: ListTile(
              title: Text('Editar Nome'),
              subtitle: Text(name),
              trailing: IconButton(
                onPressed: () {
                  nameController.text = name;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Editar nome'),
                          content: Container(
                            height: 100,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  child: TextFormField(
                                    controller: nameController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      labelText: 'Digite o nome',
                                      labelStyle: TextStyle(
                                        fontSize: 14,
                                      ),
                                      focusColor: Colors.teal.shade900,
                                    ),
                                  ),
                                ),
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
                              onPressed: () {
                                users.doc(item.id).update({
                                  'name': nameController.text,
                                });
                                Navigator.pop(context);
                              },
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
                },
                icon: Icon(Icons.edit),
              ),
            ),
          ),
        ),
        Center(
          child: Card(
            child: ListTile(
              title: Text('Email'),
              subtitle: Text(email),
            ),
          ),
        ),
        Center(
          child: Card(
            child: ListTile(
              title: Text('Senha'),
              subtitle: Text(password),
            ),
          ),
        ),
        Center(
          child: Card(
            child: ListTile(
              title: Text('Data de nascimento'),
              subtitle: Text(birthDate),
              trailing: IconButton(
                onPressed: () {
                  birthDateController.text = birthDate;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Editar nome'),
                          content: Container(
                            height: 100,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  child: TextFormField(
                                    controller: birthDateController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      labelText: 'Digite o nome',
                                      labelStyle: TextStyle(
                                        fontSize: 14,
                                      ),
                                      focusColor: Colors.teal.shade900,
                                    ),
                                  ),
                                ),
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
                              onPressed: () {
                                users.doc(item.id).update({
                                  'birthDate': birthDateController.text,
                                });
                                Navigator.pop(context);
                              },
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
                },
                icon: Icon(Icons.edit),
              ),
            ),
          ),
        ),
      ],
    );
  }

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
                Container(
                    child: StreamBuilder<QuerySnapshot>(
                  stream: users.where('email', isEqualTo: email).snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());

                      default:
                        final dados = snapshot.requireData;
                        return ShowInformations(dados.docs[0]);
                    }
                  },
                )),
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
}
