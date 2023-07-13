import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopbils/core.dart';
import '../controller/settings_controller.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  Widget build(context, SettingsController controller) {
    controller.view = this;

    return Scaffold(
    appBar: AppBar(
    title: const Text("Dashboard"),
    actions: const [],
    ),
    body: SingleChildScrollView(
    child: Container(
    padding: const EdgeInsets.all(10.0),
    child:  Column(
    children: [ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blueGrey,
    ),
    onPressed: () =>controller.doLogout(),
    child: const Text("Save"),
    ),],
    ),
    ),
    ),
    );
  }

  @override
  State<SettingsView> createState() => SettingsController();
}
