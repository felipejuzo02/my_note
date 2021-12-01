import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_note/components/Header.dart';
import 'package:my_note/components/ItemsAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Materias extends StatefulWidget {
  const Materias({Key? key}) : super(key: key);

  @override
  _MateriasState createState() => _MateriasState();
}

class _MateriasState extends State<Materias> {
  late CollectionReference materiasT;
  var materiaName = TextEditingController();
  var email = FirebaseAuth.instance.currentUser?.email;

  @override
  void initState() {
    super.initState();
    materiasT = FirebaseFirestore.instance.collection('subjects');
  }

  Widget CardMaterias(item) {
    String nome = item.data()['name'];
    return Card(
      elevation: 10,
      shadowColor: Colors.grey.shade200,
      child: ListTile(
        title: Text(
          nome,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            materiasT.doc(item.id).delete();
          },
        ),
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
              'Minhas Matérias',
              'Acesse suas matérias, adiciona novas ou exclua as existentes',
            ),
            Expanded(
              child: Container(
                  child: StreamBuilder<QuerySnapshot>(
                stream: materiasT.snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Center(
                          child: Text('Não foi possível conectar ao Firebase'));

                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());

                    default:
                      final dados = snapshot.requireData;
                      if (dados.size == 0) {
                        return Center(
                            child: Text(
                          'Nenhuma matéria cadastrada',
                        ));
                      }
                      return ListView.builder(
                          itemCount: dados.size,
                          itemBuilder: (context, index) {
                            return CardMaterias(dados.docs[index]);
                          });
                  }
                },
              )),
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
                          if (materiaName.text.isNotEmpty) {
                            materiasT
                                .add({'name': materiaName.text}).then((value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text('Matéria adicionada com sucesso!'),
                                duration: Duration(seconds: 2),
                              ));

                              materiaName.text = '';
                              Navigator.pop(context);
                            }).catchError((err) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Erro ao adicionar matéria!'),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.red.shade900,
                              ));
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Favor escreva o nome da matéria'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.red.shade900,
                            ));
                          }
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
