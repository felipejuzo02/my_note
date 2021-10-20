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
                              onTap: () {},
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
                  content: Container(
                    height: 100,
                    child: TextFormField(
                      controller: materiaName,
                      decoration: InputDecoration(
                          hintText: 'Digite o nome da atividade',
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
                      onPressed: () {
                        setState(() {
                          var msg = '';
                          if (materiaName.text.isNotEmpty) {
                            materias.add(materiaName.text);
                            materiaName.clear();
                            msg = 'A matéria foi adiciona com sucesso!';
                            Navigator.pop(context);
                          } else {
                            msg = 'Favor digitar o nome da matéria!';
                          }

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(msg),
                            duration: Duration(seconds: 2),
                          ));
                        });
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
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal.shade900,
      ),
    );
  }
}
