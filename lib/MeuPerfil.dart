import 'package:flutter/material.dart';
import 'package:my_note/components/ItemsAppBar.dart';

class MeuPerfil extends StatelessWidget {
  const MeuPerfil({Key? key}) : super(key: key);

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
    );
  }
}
