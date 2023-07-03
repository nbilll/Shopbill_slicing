
import 'package:flutter/material.dart';
import 'package:shopbils/core.dart';
import '../controller/voucher_controller.dart';

class VoucherView extends StatefulWidget {
    const VoucherView({Key? key}) : super(key: key);

    Widget build(context, VoucherController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(
        title: const Text("Voucher"),
        actions: const [],
        ),
        body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
            children: const [],
            ),
        ),
        ),
    );
    }

    @override
    State<VoucherView> createState() => VoucherController();
}
    