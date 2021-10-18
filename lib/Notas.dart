import 'package:flutter/material.dart';
import 'package:my_note/components/Header.dart';
import 'package:my_note/components/ItemsAppBar.dart';

class Notas extends StatelessWidget {
  const Notas({Key? key}) : super(key: key);

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
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Programação orientada a gambiarras',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
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
                                Text('10'),
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
                                Text('10'),
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
                                Text('1'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Column(
                              children: [
                                Text(
                                  'Média Final',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text('9.8'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
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
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Programação orientada a objetos',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
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
                                Text('10'),
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
                                Text('10'),
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
                                Text('1'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Column(
                              children: [
                                Text(
                                  'Média Final',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text('9.8'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
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
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Programação em dispositivos móveis',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
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
                                Text('10'),
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
                                Text('10'),
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
                                Text('1'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Column(
                              children: [
                                Text(
                                  'Média Final',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text('9.8'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
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
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Ingles IV',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
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
                                Text('10'),
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
                                Text('10'),
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
                                Text('1'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Column(
                              children: [
                                Text(
                                  'Média Final',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text('9.8'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
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
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Engenharia de Software',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
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
                                Text('10'),
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
                                Text('10'),
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
                                Text('1'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Column(
                              children: [
                                Text(
                                  'Média Final',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text('9.8'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
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
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Sistemas operacionais II',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
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
                                Text('10'),
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
                                Text('10'),
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
                                Text('1'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Column(
                              children: [
                                Text(
                                  'Média Final',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text('9.8'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
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
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'MPCT',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
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
                                Text('10'),
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
                                Text('10'),
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
                                Text('1'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Column(
                              children: [
                                Text(
                                  'Média Final',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text('9.8'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
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
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'Programação linear',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
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
                                Text('10'),
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
                                Text('10'),
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
                                Text('1'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 25),
                            child: Column(
                              children: [
                                Text(
                                  'Média Final',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text('9.8'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {},
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
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
