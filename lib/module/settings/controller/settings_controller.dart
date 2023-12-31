
import 'package:flutter/material.dart';
import 'package:shopbils/state_util.dart';
import '../view/settings_view.dart';

class SettingsController extends State<SettingsView> {
    static late SettingsController instance;
    late SettingsView view;

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
        
    