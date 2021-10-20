import 'package:flutter/material.dart';
import 'package:my_note/components/CheckBox.dart';
import 'package:my_note/components/Header.dart';
import 'package:my_note/components/Input.dart';
import 'package:my_note/components/ItemsAppBar.dart';

class Atividades extends StatefulWidget {
  const Atividades({Key? key}) : super(key: key);

  @override
  _AtividadesState createState() => _AtividadesState();
}

class _AtividadesState extends State<Atividades> {
  var atividades = [];
  var data = [];
  var materiaName = TextEditingController();

  @override
  void initState() {
    atividades.add('Projeto MPCT - Power Point');
    data.add('21/10/2021');
    atividades.add('Projeto App Flutter');
    data.add('21/10/2021');
    atividades.add('Protótipo Tela 1');
    data.add('29/11/2021');
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
              'Minhas Atividades',
              'Consulte ou cadastre atividades a serem feitas.',
            ),
            Container(
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  indicatorColor: Colors.teal.shade900,
                  labelColor: Colors.teal.shade900,
                  tabs: [
                    Tab(text: 'Em aberto'),
                    Tab(text: 'Concluida'),
                    Tab(text: 'Atrasada'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: atividades.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      shadowColor: Colors.grey.shade200,
                      child: ListTile(
                        title: Text(
                          atividades[index],
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text("Data de entrega: ${data[index]}"),
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
                                    Icons.check,
                                  ),
                                  Text(
                                    'Marcar como Concluida',
                                  ),
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
                                  atividades.removeAt(index);
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
                        onTap: () {},
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
        onPressed: () {
          AtividadesModal();
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal.shade900,
      ),
    );
  }

  AtividadesModal() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade200,
            title: Text('Adicionar/Editar notas:'),
            content: Container(
              height: 300,
              child: Column(
                children: [
                  TextInput('Nome atividade'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Selecione a data de entrega',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.calendar_today),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child:
                        CheckBoxWithLabel('Matéria poderá entregar atrasada?'),
                  ),
                  CheckBoxWithLabel('Atividade valerá nota?'),
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
  }
}
