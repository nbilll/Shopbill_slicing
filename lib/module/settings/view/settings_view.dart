import 'package:flutter/material.dart';
import 'package:shopbils/core.dart';
import '../controller/settings_controller.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  Widget build(context, SettingsController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Fikri Ardiansyah"),
              accountEmail: const Text("Mooogeng"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://pps.whatsapp.net/v/t61.24694-24/328790259_5887219874740986_5275699444313601155_n.jpg?ccb=11-4&oh=01_AdRXn_mVyOk4ddCljYHYikhT6bB9bAnUp8v6J6zxxWj8qQ&oe=64A6CAC9"),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
              ),
              otherAccountsPictures: const [
                // CircleAvatar(
                //   backgroundColor: Colors.white,
                //   backgroundImage: NetworkImage(
                //       "https://randomuser.me/api/portraits/women/74.jpg"),
                // ),
                // CircleAvatar(
                //   backgroundColor: Colors.white,
                //   backgroundImage: NetworkImage(
                //       "https://randomuser.me/api/portraits/men/47.jpg"),
                // ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text("About"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.rule),
              title: const Text("TOS"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text("Privacy Policy"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text("Logout"),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  @override
  State<SettingsView> createState() => SettingsController();
}
