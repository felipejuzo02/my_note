import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: const EdgeInsets.symmetric(vertical: 20.0),
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
                  // margin: EdgeInsets.only(bottom: 20),
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
        ],
      ),
    );
  }
}
