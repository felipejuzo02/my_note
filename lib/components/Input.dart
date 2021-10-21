import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget TextInput(label) {
  return Container(
    height: 100,
    child: TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 14,
        ),
        focusColor: Colors.teal.shade900,
      ),
    ),
  );
}

Widget NumberInput(label) {
  return Container(
    height: 100,
    child: TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        // ignore: deprecated_member_use
        WhitelistingTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 14,
        ),
        focusColor: Colors.teal.shade900,
      ),
    ),
  );
}

Widget PasswordInput(label) {
  return Container(
    height: 100,
    child: TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 14,
        ),
        focusColor: Colors.teal.shade900,
      ),
    ),
  );
}
