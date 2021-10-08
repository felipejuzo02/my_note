import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha nota'),
        backgroundColor: Colors.teal.shade900,
      ),
      drawer: Drawer(
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
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Sobre'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Materias'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.fact_check),
              title: Text('Notas'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Meu perfil'),
              onTap: () {},
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
      ),
    );
  }
}
