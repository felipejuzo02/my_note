import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_note/Home.dart';
import 'package:my_note/classes/InfosLogin.dart';

class ItemsAppBar extends StatefulWidget {
  const ItemsAppBar({Key? key}) : super(key: key);

  @override
  _ItemsAppBarState createState() => _ItemsAppBarState();
}

class _ItemsAppBarState extends State<ItemsAppBar> {
  String name = 's';
  late CollectionReference users;

  @override
  void initState() {
    super.initState();
    users = FirebaseFirestore.instance.collection('users');
  }

  Widget ShowInformations(item) {
    String name = item.data()['name'];
    String email = item.data()['email'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        ),
        Text(
          email,
          style: TextStyle(
            color: Colors.grey.shade200,
            fontSize: 12,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var email = FirebaseAuth.instance.currentUser?.email;
    return Container(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal.shade900,
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: users.where('email', isEqualTo: email).snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());

                    default:
                      final dados = snapshot.requireData;
                      return ListView.builder(
                          itemCount: dados.size,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                                  child: ShowInformations(dados.docs[index]),
                                )
                              ],
                            );
                          });
                  }
                },
              )),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              print(name);
              Navigator.pushNamed(
                context,
                'home',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Meu perfil'),
            onTap: () {
              Navigator.pushNamed(
                context,
                'meu-perfil',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Materias'),
            onTap: () {
              Navigator.pushNamed(
                context,
                'materias',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.quiz),
            title: Text('Atividades'),
            onTap: () {
              Navigator.pushNamed(
                context,
                'atividades',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.fact_check),
            title: Text('Notas'),
            onTap: () {
              print('teste');
              Navigator.pushNamed(
                context,
                'notas',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Sobre'),
            onTap: () {
              Navigator.pushNamed(
                context,
                'sobre',
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.red.shade900,
            ),
            title: Text(
              'Sair do Aplicativo',
              style: TextStyle(
                color: Colors.red.shade900,
              ),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(
                context,
                'login',
              );
            },
          ),
        ],
      ),
    );
  }
}
