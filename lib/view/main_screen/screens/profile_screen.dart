import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/controller/home_controller.dart';

import '../widgets/main_widgets/body_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return BodyProfileScreen();
  }
}
