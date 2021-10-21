import 'package:flutter/material.dart';
import 'package:my_note/components/Header.dart';
import 'package:my_note/components/ItemsAppBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    Card(
                      elevation: 10,
                      shadowColor: Colors.grey.shade200,
                      child: ListTile(
                        title: Text(
                          'Projeto App Flutter',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text("Data de entrega: 21/10/2021"),
                        onTap: () {},
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shadowColor: Colors.grey.shade200,
                      child: ListTile(
                        title: Text(
                          'Projeto MPCT - Power Point',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text("Data de entrega: 21/10/2021"),
                        onTap: () {},
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
                      'Suas estatísticas',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    CardHighlights(
                      'Sua maior nota',
                      Icons.star,
                      'Programação orientada a gambiarras',
                      'Nota: 10',
                    ),
                    CardHighlights(
                      'Sua menor nota',
                      Icons.thumb_down,
                      'Ingles',
                      'Nota: 6',
                    ),
                    CardHighlights(
                      'Atividades feitas',
                      Icons.task,
                      'Programação orientada a gambiarras',
                      'Quantidade: 8',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget CardHighlights(title, icon, text, value) {
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
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
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
}
