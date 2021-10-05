import 'package:flutter/material.dart';

Widget button(label) {
  return Container(
    width: 250,
    height: 70,
    padding: EdgeInsets.only(top: 20),
    child: ElevatedButton(
      child: Text(label),
      onPressed: () {},
    ),
  );
}
