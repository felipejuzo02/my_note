import 'package:flutter/material.dart';

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
