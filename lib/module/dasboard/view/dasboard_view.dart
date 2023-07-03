import 'package:flutter/material.dart';
import 'package:shopbils/core.dart';
import '../controller/dasboard_controller.dart';

class DasboardView extends StatefulWidget {
  const DasboardView({Key? key}) : super(key: key);

  Widget build(context, DasboardController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 4,
      initialIndex: controller.selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex,
          children: [
            HomeView(),
            Container(
              color: Colors.green,
            ),
            WalletView(),
            SettingsView()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: (newIndex) => controller.updateIndex(newIndex),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xff4dab97),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.airplane_ticket_sharp,
              ),
              label: "Voucher",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.wallet_outlined,
              ),
              label: "wallet",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DasboardView> createState() => DasboardController();
}
