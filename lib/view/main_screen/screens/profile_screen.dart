import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/controller/home_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder:
          (controller) => Scaffold(
            appBar: AppBar(
              title: Text("Profile"),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: controller.changeThemeMode,
                  icon: controller.changeIconTheme(),
                ),
              ],
            ),
          ),
    );
  }
}
