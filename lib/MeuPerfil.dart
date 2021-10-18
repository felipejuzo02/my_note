import 'package:flutter/material.dart';
import 'package:my_note/components/Header.dart';
import 'package:my_note/components/ItemsAppBar.dart';
import 'package:my_note/components/MainButton.dart';

class MeuPerfil extends StatefulWidget {
  const MeuPerfil({Key? key}) : super(key: key);

  @override
  _MeuPerfilState createState() => _MeuPerfilState();
}

class _MeuPerfilState extends State<MeuPerfil> {
  var nome = 'Luis Felipe Juzo';
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
        child: Column(
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
                      subtitle: Text(nome),
                      trailing: IconButton(
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Alterar nome:'),
                                  content: Container(
                                    height: 100,
                                    child: TextFormField(
                                      controller: nomeController,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 14)),
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
                      subtitle: Text('felipejuzo02@hotmail.com'),
                      trailing: IconButton(
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Alterar e-mail:'),
                                  content: Container(
                                    height: 100,
                                    child: TextFormField(
                                      controller: nomeController,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 14)),
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
                      subtitle: Text('123456'),
                      trailing: IconButton(
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Alterar senha:'),
                                  content: Container(
                                    height: 100,
                                    child: TextFormField(
                                      controller: nomeController,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 14)),
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
                      subtitle: Text('19/07/2001'),
                      trailing: IconButton(
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Alterar data de nascimento:'),
                                  content: Container(
                                    height: 100,
                                    child: TextFormField(
                                      controller: nomeController,
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(fontSize: 14)),
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
}
