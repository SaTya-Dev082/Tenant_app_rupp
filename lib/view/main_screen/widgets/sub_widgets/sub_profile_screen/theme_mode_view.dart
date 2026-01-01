import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tenant_app/controller/home_controller.dart';

class ThemeModeView extends StatelessWidget {
  ThemeModeView({super.key});
  final HomeController controller = Get.find();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder:
          (controller) => Scaffold(
            appBar: AppBar(title: const Text("Change Theme Mode")),
            body: Column(
              children: [
                RadioListTile<bool>(
                  title: const Text("Light Mode"),
                  value: false,
                  groupValue: controller.isDarkMode,
                  onChanged: (value) {
                    controller.setThemeMode(value!);
                  },
                ),

                RadioListTile<bool>(
                  title: const Text("Dark Mode"),
                  value: true,
                  groupValue: controller.isDarkMode,
                  onChanged: (value) {
                    controller.setThemeMode(value!);
                  },
                ),
              ],
            ),
          ),
    );
  }
}
