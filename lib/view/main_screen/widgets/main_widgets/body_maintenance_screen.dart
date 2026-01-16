import 'package:flutter/material.dart';
import '../sub_widgets/sub_home_screen/payment_history.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../controller/home_controller.dart';
import '../sub_widgets/sub_home_screen/maintenance_request.dart';
import '../sub_widgets/sub_home_screen/make_payment.dart';
import '../sub_widgets/sub_home_screen/my_lease.dart';
import '../sub_widgets/sub_home_screen/payment_history.dart';
import '../sub_widgets/sub_maintenance_screen/build_maintenance_request.dart';

final HomeController controller = Get.find();
final box = GetStorage();

Widget bodyMaintenanceScreen() {
  var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
  var bgColor =
      box.read("theme") != "dark" ? Color(0XFFFFFFFF) : Color(0XFF282727);
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Maintenance',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.build_circle_outlined,
              size: 50,
              color: Colors.grey.shade300,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'No Pending Issues',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your room is in great shape!',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              Get.to(() => const SubmitMaintenanceScreen());
            },
            icon: const Icon(Icons.add),
            label: const Text('New Request'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
