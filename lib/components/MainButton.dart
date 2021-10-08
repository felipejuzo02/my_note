import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton(this.label, this.routeName, {Key? key}) : super(key: key);
  final String label;
  final String routeName;

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              Navigator.pushNamed(
                context,
                routeName,
              );
            },
          )),
        ));
  }
}
