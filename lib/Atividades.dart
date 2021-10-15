import 'package:flutter/material.dart';
import 'package:my_note/components/Header.dart';
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
    data.add('19/10/2021');
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
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red.shade900,
                                  ),
                                  Text(
                                    'Marcar como Concluida',
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
                    height: 200,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Digite o nome da atividade',
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text('Selecione uma data'),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.calendar_today))
                          ],
                        )
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(onPressed: () {}, child: Text('Salvar'))
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
