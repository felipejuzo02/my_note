import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_note/components/Header.dart';
import 'package:my_note/components/ItemsAppBar.dart';

class Notas extends StatefulWidget {
  const Notas({Key? key}) : super(key: key);

  @override
  _NotasState createState() => _NotasState();
}

class _NotasState extends State<Notas> {
  late CollectionReference notes;
  var notaP1Controller = TextEditingController();
  var notaP2Controller = TextEditingController();
  var notaAtividadeController = TextEditingController();
  var nomeCursoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    notes = FirebaseFirestore.instance.collection('notes');
  }

  Widget CardNotas(item) {
    String nomeCurso = item.data()['nomeCurso'];
    String notaP1 = item.data()['notaP1'];
    String notaP2 = item.data()['notaP2'];
    String notaAtividade = item.data()['notaAtividade'];

    var media = (double.parse(notaP1) + double.parse(notaP2)) / 2 +
        (double.parse(notaAtividade) * 0.3);
    if (media > 10) {
      media = 10;
    }

    return Column(
      children: [
        ListTile(
          title: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              nomeCurso,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          subtitle: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Column(
                  children: [
                    Text(
                      'P1',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(notaP1),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Column(
                  children: [
                    Text(
                      'P2',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(notaP2),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Column(
                  children: [
                    Text(
                      'Atividades',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(notaAtividade),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 25),
                child: Column(
                  children: [
                    Text(
                      'Média',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(media.toString()),
                  ],
                ),
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              notaAtividadeController.text = notaAtividade;
              notaP1Controller.text = notaP1;
              notaP2Controller.text = notaP2;
              nomeCursoController.text = nomeCurso;

              NotesModal(item.id);
            },
            icon: Icon(
              Icons.edit,
              size: 20,
            ),
          ),
        ),
        Divider(
          height: 40,
          thickness: 0.4,
          color: Colors.teal.shade900,
          indent: 10,
          endIndent: 10,
        ),
      ],
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              'Minhas Notas',
              'Suas notas de todas as matérias você encontra aqui.',
            ),
            Container(
              child: Expanded(
                child: Container(
                    child: StreamBuilder<QuerySnapshot>(
                  stream: notes.snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Center(
                            child:
                                Text('Não foi possível conectar ao Firebase'));

                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());

                      default:
                        final dados = snapshot.requireData;
                        if (dados.size == 0) {
                          return Center(
                              child: Text(
                            'Nenhuma nota cadastrada',
                          ));
                        }
                        return ListView.builder(
                            itemCount: dados.size,
                            itemBuilder: (context, index) {
                              return CardNotas(dados.docs[index]);
                            });
                    }
                  },
                )),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nomeCursoController.clear();
          notaP1Controller.clear();
          notaP2Controller.clear();
          notaAtividadeController.clear();
          NotesModal(null);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal.shade900,
      ),
    );
  }

  NotesModal(id) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Adicionar/Editar notas:'),
            content: Container(
              height: 350,
              child: Column(
                children: [
                  Container(
                    height: 80,
                    child: TextFormField(
                      controller: nomeCursoController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Nome do curso',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        focusColor: Colors.teal.shade900,
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    child: TextFormField(
                      controller: notaP1Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Nota P1',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        focusColor: Colors.teal.shade900,
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    child: TextFormField(
                      controller: notaP2Controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Nota P2',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        focusColor: Colors.teal.shade900,
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    child: TextFormField(
                      controller: notaAtividadeController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Nota Atividades',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        focusColor: Colors.teal.shade900,
                      ),
                    ),
                  ),
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
              if (id != null)
                TextButton(
                  child: Text('Excluir'),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(10.0),
                    primary: Colors.white,
                    backgroundColor: Colors.red.shade900,
                    textStyle: TextStyle(fontSize: 14),
                  ),
                  onPressed: () {
                    notes.doc(id).delete();
                    Navigator.pop(context);
                  },
                ),
              TextButton(
                onPressed: () {
                  setState(() {
                    var message = '';
                    if (id == null) {
                      notes.add({
                        'nomeCurso': nomeCursoController.text,
                        'notaP1': notaP1Controller.text,
                        'notaP2': notaP2Controller.text,
                        'notaAtividade': notaAtividadeController.text,
                      });

                      message = 'Nota adicionada com sucesso!';
                    } else {
                      notes.doc(id).update({
                        'nomeCurso': nomeCursoController.text,
                        'notaP1': notaP1Controller.text,
                        'notaP2': notaP2Controller.text,
                        'notaAtividade': notaAtividadeController.text,
                      });

                      message = 'Nota editada com sucesso!';
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(message),
                      duration: Duration(seconds: 2),
                    ));

                    Navigator.pop(context);
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
