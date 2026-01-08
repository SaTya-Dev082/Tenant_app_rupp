import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tenant_app/view/main_screen/widgets/sub_widgets/sub_payment_screen/build_payment_success.dart';

class PaymentSuccessScreen extends StatelessWidget {
  PaymentSuccessScreen({super.key});
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Success",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: color,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_outlined, color: color),
        ),
      ),
      body: Center(child: buildPaymentSuccess()),
    );
  }
}
