import 'package:flutter/material.dart';
import 'package:my_note/components/Header.dart';
import 'package:my_note/components/ItemsAppBar.dart';

class Materias extends StatefulWidget {
  const Materias({Key? key}) : super(key: key);

  @override
  _MateriasState createState() => _MateriasState();
}

class _MateriasState extends State<Materias> {
  var materias = [];
  var materiaName = TextEditingController();

  @override
  void initState() {
    materias.add('Programação Orientada a Objetos');
    materias.add('Programação Dispositivos Móveis');
    materias.add('Engenharia de Software');
    materias.add('Inglês');
    materias.add('Metodologia de Pesquisa Cientifíca');
    materias.add('Sistemas Operacionais');
    materias.add('Banco de Dados');
    super.initState();
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
        child: Column(
          children: [
            Header(
              'Minhas Matérias',
              'Acesse suas matérias, adiciona novas ou exclua as existentes',
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: materias.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      shadowColor: Colors.grey.shade200,
                      child: ListTile(
                        title: Text(
                          materias[index],
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        trailing: PopupMenuButton(
                          itemBuilder: (context) => <PopupMenuEntry>[
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(Icons.edit),
                                  Text('Editar'),
                                ],
                              ),
                              onTap: () {
                                print('teste');
                              },
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red.shade900,
                                  ),
                                  Text(
                                    'Excluir',
                                    style: TextStyle(
                                      color: Colors.red.shade900,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  materias.removeAt(index);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text('Matéria removida com sucesso!'),
                                    duration: Duration(seconds: 2),
                                  ));
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Adicionar Matéria'),
                  content: TextField(
                    controller: materiaName,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal.shade900,
      ),
    );
  }
}
