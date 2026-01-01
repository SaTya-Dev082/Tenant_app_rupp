import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../widgets/main_widgets/body_payment_screen.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(
                "Payment",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: color,
                ),
              ),
              buildBodyPaymentScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
