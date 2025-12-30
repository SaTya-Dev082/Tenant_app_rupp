import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/controller/home_controller.dart';
import 'package:tenant_app/view/main_screen/screens/home_screen.dart';
import 'package:tenant_app/view/main_screen/screens/maintenance_screen.dart';
import 'package:tenant_app/view/main_screen/screens/payment_screen.dart';
import 'package:tenant_app/view/main_screen/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.find<HomeController>();
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder:
          (controller) => Scaffold(
            body: PageView(
              controller: pageController,
              onPageChanged: (index) {
                controller.changeBottomIndex(index: index);
              },
              children: [
                HomeScreen(),
                PaymentScreen(),
                MaintenanceScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              selectedItemColor: Colors.orange,
              onTap: (index) {
                controller.changeBottomIndex(index: index);
                pageController.jumpToPage(index);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.payments_outlined),
                  activeIcon: Icon(Icons.payments),
                  label: "Payments",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.build_outlined),
                  activeIcon: Icon(Icons.build_sharp),
                  label: "Maintenance",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  activeIcon: Icon(Icons.account_circle_rounded),
                  label: "Profile",
                ),
              ],
            ),
          ),
    );
  }
}
