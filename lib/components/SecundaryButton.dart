import 'package:flutter/material.dart';

class secundaryButton extends StatelessWidget {
  const secundaryButton(this.label, this.routeName, {Key? key})
      : super(key: key);

  final String label;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        padding: EdgeInsets.only(top: 20),
        child: SizedBox.expand(
          child: (OutlinedButton(
            child: Text(label),
            style: OutlinedButton.styleFrom(
              primary: Colors.teal.shade900,
            ),
            onPressed: () {
              Navigator.pushNamed(context, routeName);
            },
          )),
        ));
  }
}
