import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  // BottomNavigationBar
  var currentIndex = 0;
  void changeBottomIndex({required int index}) {
    currentIndex = index;
    update();
  }

  // Block Theme Mode
  bool isDarkMode = false;
  void setThemeMode(bool value) {
    var theme = Get.isDarkMode;
    if (theme) {
      Get.changeThemeMode(ThemeMode.light);
      box.write("theme", "light");
      isDarkMode = false;
    } else {
      Get.changeThemeMode(ThemeMode.dark);
      box.write("theme", "dark");
      isDarkMode = true;
    }
    update();
  }

  IconButton changeIconTheme(bool value) {
    String? theme = box.read("theme");
    return IconButton(
      onPressed: () {
        setThemeMode(value);
      },
      icon: Icon(
        theme == "dark" ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
      ),
    );
  }

  // Switch block
  bool isMotoParking = false;
  void changeParking(bool value) {
    isMotoParking = value;
    box.write("parking", value);
    update();
  }

  // Choose Date
  int selectedId = 1;
  List<Map<String, dynamic>> dates = [
    {"id": 1, "data": "01-Jan-2026"},
    {"id": 2, "data": "01-Feb-2026"},
    {"id": 3, "data": "01-Mar-2026"},
    {"id": 4, "data": "01-Apr-2026"},
    {"id": 5, "data": "01-May-2026"},
    {"id": 6, "data": "01-Jun-2026"},
    {"id": 7, "data": "01-Jul-2026"},
    {"id": 8, "data": "01-Aug-2026"},
    {"id": 9, "data": "01-Sep-2026"},
    {"id": 10, "data": "01-Oct-2026"},
    {"id": 11, "data": "01-Nov-2026"},
    {"id": 12, "data": "01-Dec-2026"},
  ];
  void chooseDate(int date) {
    selectedId = date;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    isMotoParking = box.read("parking") ?? false;
    isDarkMode = box.read("theme") == "dark";
  }
}
