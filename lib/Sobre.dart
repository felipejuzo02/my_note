import 'package:flutter/material.dart';
import 'package:my_note/components/Header.dart';
import 'package:my_note/components/ItemsAppBar.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

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
              'Sobre',
              'Informações sobre o projeto, sua ideia principal e o autor.',
            ),
            Column(
              children: [
                Text(
                  'Tema escolhido',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'O tema escolhido para se desenvolver, é um aplicativo de gestão escolar do aluno.',
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  'O projeto',
                  style: Theme.of(context).textTheme.headline3,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'O projeto se trata de um gestor da vida acadêmica do aluno. Nele é possível que ele inclua as matérias que o mesmo tem em sua grade, sendo que ele será avisado conforme horários escolhidos que sua aula está prestes a começar. No app ele terá controle total de suas atividades, tendo que que ja foi entregue e que ainda é preciso entregar. O mais importante, terá sua média calculada a partir das notas inseridas por ele, mantendo assim um controle sobre sua vida acabêmica.',
                    textAlign: TextAlign.center,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.asset('lib/assets/me.jpg'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text(
                        'Luis Felipe Juzo Colares',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        'Desenvolvedor Frontend',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
