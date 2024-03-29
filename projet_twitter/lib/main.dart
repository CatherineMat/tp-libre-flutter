import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:tp05_correction/form-switch.dart';
import 'package:tp05_correction/loginform.dart';

import 'content-body.dart';
import 'footer.dart';
import 'header.dart';


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

// home: Scaffold(
//   appBar: AppBar(
//     title: Text("Twitter"),
//   ),
//   body: Padding(
//     padding:  EdgeInsets.all(10.0),
//     child: Column(
//       children: [
//         // Header
//         Header(),
//         LoginForm(),
//         // Content
//         Expanded(child: ListViewBody()),
//         // Footer
//         Footer(),
//       ],
//     ),
//   ),
// ),

  // Form buildForm(BuildContext context) {
  //   return Form(
  //               key: _formKey,
  //               child: Column(
  //                 children: [
  //                   Text("Connexion à Twitter"),
  //                   TextFormField(
  //                     decoration: InputDecoration(
  //                       labelText: "Identifiant"
  //                     ),
  //                     validator: (String? value){
  //                       if (!EmailValidator.validate(value!)){
  //                         return "Format invalide";
  //                       };
  //                     },
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Row(
  //                       children: [
  //                         FormSwitch(),
  //                         Text("Mémoriser mes informations",
  //                             style: TextStyle(color: Colors.black54))
  //                       ],
  //                     ),
  //                   ),
  //                   FilledButton(
  //                     onPressed: () => onPressed(context),
  //                     child: const Text("Connexion"),
  //                   ),
  //                 ],
  //               ),
  //           );
  // }

void onPressed(BuildContext context) {
  if (_formKey.currentState?.validate() == true) {
    print("Success !");
  }
}
}



