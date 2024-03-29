import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tp05_correction/header.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Twitter"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Connexion Twitter",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              TextFormField(
                  decoration: InputDecoration(labelText: "Identifiant"),
                  validator: validateEmail),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                ),
                validator: validatePassword,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    FormSwitch(),
                    Text("Mémoriser mes informations",
                        style: TextStyle(color: Colors.black54))
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Connexion"),
                    ),
                    onPressed: onSubmit),
              )
            ],
          ),
        ),
      ),
    );
  }


  /**
   * Pour l'instant afficher une dialogue box
   */
  void displaySuccessDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Connexion réussi'),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/tweets');
                },
                child: const Text('Ok'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    // Contrôle de surface
    if (_formKey.currentState!.validate()) {
      // Connexion reussi
      displaySuccessDialog();
    }
  }

  /*
    * Valider le mot de passe
   */
  String? validatePassword(String? value) {
    if (value!.length < 5) {
      return "Mot de passe non sécurisé";
    }
    return null;
  }

  /*
    * Valider l'email
   */
  String? validateEmail(String? value) {
    if (!EmailValidator.validate(value!)) {
      return "Email invalide";
    }
    return null;
  }
}

class FormSwitch extends StatefulWidget {
  const FormSwitch({super.key});

  @override
  State<FormSwitch> createState() => _FormSwitchState();
}

class _FormSwitchState extends State<FormSwitch> {

  bool _switchEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _switchEnabled,
      onChanged: (value) {
        setState(() {
          _switchEnabled = !_switchEnabled;
        });
      },
    );
  }
}

