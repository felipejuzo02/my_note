import 'package:flutter/material.dart';

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
