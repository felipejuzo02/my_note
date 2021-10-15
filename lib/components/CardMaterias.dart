import 'package:flutter/material.dart';

class CardMaterias extends StatelessWidget {
  const CardMaterias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text('POO'),
      trailing: Icon(Icons.more_vert),
      hoverColor: Colors.grey.shade200,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Tarefa selecionada:'),
          duration: Duration(seconds: 2),
        ));
      },
    );
  }
}
