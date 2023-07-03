
import 'package:flutter/material.dart';
import 'package:shopbils/state_util.dart';
import '../view/voucher_view.dart';

class VoucherController extends State<VoucherView> {
    static late VoucherController instance;
    late VoucherView view;

    @override
    void initState() {
        instance = this;
        super.initState();
    }

    @override
    void dispose() => super.dispose();

    @override
    Widget build(BuildContext context) => widget.build(context, this);
}
        
    