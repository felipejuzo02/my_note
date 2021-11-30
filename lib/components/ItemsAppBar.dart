import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_note/Home.dart';

class ItemsAppBar extends StatefulWidget {
  const ItemsAppBar({Key? key}) : super(key: key);

  @override
  _ItemsAppBarState createState() => _ItemsAppBarState();
}

Widget informations(item) {
  String name = item.data()['name'];
  return Text(name);
}

class _ItemsAppBarState extends State<ItemsAppBar> {
  String name = 's';
  late CollectionReference materiasT;

  @override
  void initState() {
    super.initState();
    materiasT = FirebaseFirestore.instance.collection('subjects');
  }

  @override
  Widget build(BuildContext context) {
    var name = profile.name;
    var email = profile.email;
    // var email = ModalRoute.of(context)!.settings.arguments as InfosLogin;
    return Container(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal.shade900,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ),
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
