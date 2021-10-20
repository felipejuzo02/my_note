import 'package:flutter/material.dart';
import 'package:my_note/components/ItemsAppBar.dart';

class Atividades extends StatefulWidget {
  const Atividades({Key? key}) : super(key: key);

  @override
  _AtividadesState createState() => _AtividadesState();
}

class _AtividadesState extends State<Atividades> {
  var atividadesAberto = [];
  var atividadesConcluida = [];
  var atividadesAtrasada = [];
  var dataAberto = [];
  var dataConcluida = [];
  var dataAtrasada = [];
  var materiaName = TextEditingController();

  @override
  void initState() {
    atividadesAberto.add('Projeto engenharia de software');
    dataAberto.add('20/11/2021');
    atividadesAberto.add('Teste3');
    dataAberto.add('20/11/2021');
    atividadesConcluida.add('Teste 4');
    dataConcluida.add('20/11/2021');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Minha nota'),
            backgroundColor: Colors.teal.shade900,
            bottom: TabBar(
              indicatorColor: Colors.teal.shade900,
              labelColor: Colors.white,
              tabs: [
                Tab(text: 'Em aberto'),
                Tab(text: 'Concluida'),
                Tab(text: 'Atrasada'),
              ],
            ),
          ),
          drawer: Drawer(
            child: ItemsAppBar(),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: atividadesAberto.length,
                itemBuilder: (content, index) {
                  return Card(
                    elevation: 10,
                    shadowColor: Colors.grey.shade200,
                    child: ListTile(
                      title: Text(
                        atividadesAberto[index],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text("Data de entrega: ${dataAberto[index]}"),
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
                                  Icons.check,
                                ),
                                Text('Marcar como concluida'),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                atividadesConcluida
                                    .add(atividadesAberto[index]);
                                atividadesAberto.removeAt(index);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      'Matéria marcado como concluida com sucesso!'),
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
                                  'Excluir',
                                  style: TextStyle(
                                    color: Colors.red.shade900,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                atividadesAberto.removeAt(index);
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
              ListView.builder(
                itemCount: atividadesConcluida.length,
                itemBuilder: (content, index) {
                  return Card(
                    elevation: 10,
                    shadowColor: Colors.grey.shade200,
                    child: ListTile(
                      title: Text(
                        atividadesConcluida[index],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      subtitle:
                          Text("Data de entrega: ${dataConcluida[index]}"),
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
                                  Icons.check,
                                ),
                                Text('Marcar como concluida'),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                atividadesConcluida.removeAt(index);
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
                                  'Excluir',
                                  style: TextStyle(
                                    color: Colors.red.shade900,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                atividadesConcluida.removeAt(index);
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
              ListView.builder(
                itemCount: atividadesAtrasada.length,
                itemBuilder: (content, index) {
                  return Card(
                    elevation: 10,
                    shadowColor: Colors.grey.shade200,
                    child: ListTile(
                      title: Text(
                        atividadesAtrasada[index],
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text("Data de entrega: ${dataAtrasada[index]}"),
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
                                  Icons.check,
                                ),
                                Text('Marcar como concluida'),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                atividadesAtrasada.removeAt(index);
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
                                  'Excluir',
                                  style: TextStyle(
                                    color: Colors.red.shade900,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                atividadesAtrasada.removeAt(index);
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
            ],
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
        ),
      ),
    );
  }
}
