import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/view/main_screen/screens/main_screen.dart';

import '../../main_widgets/body_payment_screen.dart';

class MakePaymentScreen extends StatelessWidget {
  const MakePaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.changeBottomIndex(index: 0);
                      Get.to(MainScreen());
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: color,
                      size: 27,
                    ),
                  ),
                  SizedBox(width: 118),
                  Text(
                    "Payment",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: color,
                    ),
                  ),
                ],
              ),
              buildBodyPaymentScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
