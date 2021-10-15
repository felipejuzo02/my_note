import 'package:flutter/material.dart';

class ItemsAppBar extends StatelessWidget {
  const ItemsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  'Nome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),
                ),
                Text(
                  'seuemail@hotmail.com',
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
