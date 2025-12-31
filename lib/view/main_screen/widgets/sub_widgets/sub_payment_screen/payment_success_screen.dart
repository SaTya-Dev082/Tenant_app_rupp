import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/view/main_screen/widgets/sub_widgets/sub_payment_screen/build_payment_success.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Success",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
        ),
      ),
      body: Center(child: buildPaymentSuccess()),
    );
  }
}
