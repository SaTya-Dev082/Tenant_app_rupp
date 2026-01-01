import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tenant_app/view/main_screen/screens/main_screen.dart';

import '../../../../../controller/home_controller.dart';
import '../sub_payment_screen/build_payment_history.dart';

class PaymentHistoryScreen extends StatelessWidget {
  PaymentHistoryScreen({super.key});
  final HomeController controller = Get.find();
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
    var bgColor =
        box.read("theme") != "dark" ? Color(0XFFFFFFFF) : Color(0XFF282727);
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(body: buildPaymentHistory()),
    );
  }
}
