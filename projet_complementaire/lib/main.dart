


import 'package:flutter/material.dart';

void main() {
  runApp(TPTwitterApp());
}

class TPTwitterApp extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => LoginForm(),
        "/tweets": (context) => ListViewBody(),
      },
      initialRoute: "/",
    );
  }
}