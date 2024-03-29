import 'package:flutter/material.dart';

class FormSwitch extends StatefulWidget {
  const FormSwitch({super.key});

  @override
  State<FormSwitch> createState() => _FormSwitchState();
}

class _FormSwitchState extends State<FormSwitch> {
  bool actif = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: actif,
        onChanged: (value) {
          setState(() {
            actif = !actif;
          });
        });
  }
}
