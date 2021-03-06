import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_note/components/CheckBox.dart';
import 'package:my_note/components/Header.dart';
import 'package:my_note/components/ItemsAppBar.dart';

class Atividades extends StatefulWidget {
  const Atividades({Key? key}) : super(key: key);

  @override
  _AtividadesState createState() => _AtividadesState();
}

class _AtividadesState extends State<Atividades> {
  late CollectionReference activity;
  var acitivityName = TextEditingController();
  var dueDateName = TextEditingController();

  @override
  void initState() {
    super.initState();
    activity = FirebaseFirestore.instance.collection('activities');
  }

  Widget CardAtividade(item) {
    String atividade = item.data()['activity'];
    String dataEntrega = item.data()['dueDate'];

    return Card(
      elevation: 10,
      shadowColor: Colors.grey.shade200,
      child: ListTile(
        title: Text(
          atividade,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        subtitle: Text('Data de entrega: $dataEntrega'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            activity.doc(item.id).delete().then((value) {
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Atividade removida com sucesso!'),
                  duration: Duration(seconds: 2),
                ));
              });
            });
          },
        ),
        onTap: () {},
      ),
    );
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
            Expanded(
              child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                stream: activity.snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(
                          child: Text('N??o foi poss??vel conectar ao Firebase'));

                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());

                    default:
                      final dados = snapshot.requireData;
                      if (dados.size == 0) {
                        return Center(
                            child: Text(
                          'Nenhuma atividade cadastrada',
                        ));
                      }
                      return ListView.builder(
                          itemCount: dados.size,
                          itemBuilder: (context, index) {
                            return CardAtividade(dados.docs[index]);
                          });
                  }
                },
              )),
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
                  Container(
                    height: 70,
                    child: TextFormField(
                      controller: acitivityName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Nome da atividade',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        focusColor: Colors.teal.shade900,
                      ),
                    ),
                  ),
                  Container(
                    height: 70,
                    child: TextFormField(
                      controller: dueDateName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Data de vencimento',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        focusColor: Colors.teal.shade900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child:
                        CheckBoxWithLabel('Mat??ria poder?? entregar atrasada?'),
                  ),
                  CheckBoxWithLabel('Atividade valer?? nota?'),
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
                onPressed: () {
                  setState(() {
                    activity.add({
                      'activity': acitivityName.text,
                      'dueDate': dueDateName.text,
                    }).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Atividade adicionada com sucesso!'),
                        duration: Duration(seconds: 2),
                      ));

                      acitivityName.text = '';
                      dueDateName.text = '';
                      Navigator.pop(context);
                    });
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
  }
}
