import 'package:plaudarn/Screen/Sign_up.dart';
import 'package:plaudarn/Screen/Welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screen/Sign_up.dart';
import 'Screen/Chat.dart';
import 'Screen/Sign_in.dart';

void main() {
  runApp(Communify());
}

class Communify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),

      initialRoute: Welcome.id,
      routes: {
        Welcome.id :(context) => Welcome(),
        Sign_in.id :(context) => Sign_in(),
        Sign_up.id :(context) => Sign_up(),
        Chat.id :(context) => Chat(),
      },
    );
  }
}
