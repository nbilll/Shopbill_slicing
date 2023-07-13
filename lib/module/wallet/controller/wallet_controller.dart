import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/wallet_view.dart';

class WalletController extends State<WalletView> {
  static late WalletController instance;
  late WalletView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  var counter = 0.obs;
  updatingCounter() async {
    counter.value += 1;
    await Future.delayed(Duration(seconds: 2));
    counter.value += 2;
  }
}
