import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha Nota',
      theme: ThemeData(
        primaryColor: Colors.teal.shade900,
        backgroundColor: Colors.grey.shade100,
        focusColor: Colors.grey.shade600,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 32, color: Colors.teal.shade900),
          headline2: TextStyle(
            fontSize: 24,
            color: Colors.grey.shade50,
          ),
        ),
      ),
      home: TelaPrincipal(),
    ),
  );
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Image.asset('lib/assets/home.png'),
              input('Usuário'),
              input('Senha'),
              Container(
                child: TextButton(
                  child: Text('Esqueceu a senha'),
                  style: TextButton.styleFrom(),
                  onPressed: () {},
                ),
              ),
              mainButton('Login'),
              secundaryButton('Cadastre-se')
            ],
          )),
    );
  }
}

Widget input(label) {
  return Container(
    height: 70,
    margin: EdgeInsets.only(bottom: 10),
    child: (TextFormField(
      decoration: InputDecoration(
        hintText: label,
      ),
    )),
  );
}

Widget mainButton(label) {
  return Container(
      height: 70,
      padding: EdgeInsets.only(top: 20),
      child: SizedBox.expand(
        child: (ElevatedButton(
          child: Text(label),
          style: ElevatedButton.styleFrom(
            primary: Colors.teal.shade900,
            textStyle: TextStyle(fontSize: 18),
          ),
          onPressed: () {},
        )),
      ));
}

Widget secundaryButton(label) {
  return Container(
      height: 70,
      padding: EdgeInsets.only(top: 20),
      child: SizedBox.expand(
        child: (OutlinedButton(
          child: Text(label),
          style: OutlinedButton.styleFrom(
            primary: Colors.teal.shade900,
          ),
          onPressed: () {},
        )),
      ));
}
