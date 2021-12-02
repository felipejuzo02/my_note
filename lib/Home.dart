import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_note/components/Header.dart';
import 'package:my_note/components/ItemsAppBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CollectionReference activity;
  late CollectionReference subjects;

  @override
  void initState() {
    super.initState();
    activity = FirebaseFirestore.instance.collection('activities');
    subjects = FirebaseFirestore.instance.collection('subjects');
  }

  Widget CardActivity(item) {
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
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var email = FirebaseAuth.instance.currentUser?.email;
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
          child: ListView(
            children: [
              Header(
                'Pagina Inicial',
                'Suas principais informações e novidades se encontra aqui.',
              ),
              Container(
                height: 185.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 280,
                      height: 180,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.teal.shade900),
                        image: DecorationImage(
                            image: AssetImage('lib/assets/banner0.jpg')),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 280,
                      height: 180,
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.teal.shade900),
                        image: DecorationImage(
                            image: AssetImage('lib/assets/banner1.jpg')),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 280,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.teal.shade900),
                        image: DecorationImage(
                            image: AssetImage('lib/assets/banner2.jpg')),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Próxima(s) atividade a vencer',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: activity.snapshots(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Center(
                                child: Text(
                                    'Não foi possível conectar ao Firebase'));

                          case ConnectionState.waiting:
                            return const Center(
                                child: CircularProgressIndicator());

                          default:
                            final dados = snapshot.requireData;
                            if (dados.size == 0) {
                              return Padding(
                                padding: EdgeInsets.only(top: 10),
                                child:
                                    Text('Nenhuma atividade prestes a vencer'),
                              );
                            }

                            if (dados.size >= 3) {
                              return Column(
                                children: [
                                  CardActivity(dados.docs[0]),
                                  CardActivity(dados.docs[1]),
                                  CardActivity(dados.docs[2]),
                                ],
                              );
                            } else {
                              return Column(
                                children: dados.docs
                                    .map((doc) => CardActivity(doc))
                                    .toList(),
                              );
                            }
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suas estatísticas',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: subjects.snapshots(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Center(
                                child: Text(
                                    'Não foi possível conectar ao Firebase'));

                          case ConnectionState.waiting:
                            return const Center(
                                child: CircularProgressIndicator());

                          default:
                            final dados = snapshot.requireData;
                            var subjectsNumber = dados.size;

                            if (dados.size == 0) {
                              return Padding(
                                padding: EdgeInsets.only(top: 0),
                              );
                            }

                            return Column(
                              children: [
                                CardHighlights(
                                  'Quantidade de matérias cadastradas',
                                  Icons.view_in_ar,
                                  'Total: $subjectsNumber',
                                )
                              ],
                            );
                        }
                      },
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: activity.snapshots(),
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Center(
                                child: Text(
                                    'Não foi possível conectar ao Firebase'));

                          case ConnectionState.waiting:
                            return const Center(
                                child: CircularProgressIndicator());

                          default:
                            final dados = snapshot.requireData;
                            var activitiesNumber = dados.size;
                            return Column(
                              children: [
                                CardHighlights(
                                  'Quantidade de atividades a serem feitas',
                                  Icons.grading,
                                  'Total: $activitiesNumber',
                                )
                              ],
                            );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget CardHighlights(title, icon, value) {
    return Container(
        height: 200,
        child: SizedBox.expand(
          child: Card(
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.teal.shade900,
                  ),
                ),
                Icon(
                  icon,
                  color: Colors.teal.shade900,
                  size: 70,
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void searchBestNote() {}
}
