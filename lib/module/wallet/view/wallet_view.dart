import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopbils/core.dart';
import '../controller/wallet_controller.dart';

class WalletView extends StatefulWidget {
  const WalletView({Key? key}) : super(key: key);

  Widget build(context, WalletController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Obx(() {
                return Text(
                  "${controller.counter}",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () => controller.updatingCounter(),
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<WalletView> createState() => WalletController();
}
