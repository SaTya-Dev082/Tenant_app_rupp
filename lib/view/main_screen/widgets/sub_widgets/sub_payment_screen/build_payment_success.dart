import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:tenant_app/view/main_screen/screens/main_screen.dart';
import 'package:tenant_app/view/main_screen/screens/profile_screen.dart';
import 'package:tenant_app/view/main_screen/widgets/main_widgets/body_home_screen.dart';
import 'package:tenant_app/view/main_screen/widgets/sub_widgets/sub_home_screen/payment_history.dart';

import '../../main_widgets/body_profile_screen.dart';

final box = GetStorage();
Widget buildPaymentSuccess() {
  var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
  var bgColor =
      box.read("theme") != "dark" ? Color(0XFFFFFFFF) : Color(0XFF282727);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Column(
      spacing: 8.2,
      children: [
        Container(
          height: 82,
          width: 82,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(80),
          ),
          child: Center(child: Icon(Icons.done, size: 40, color: Colors.white)),
        ),
        Text(
          "Payment Successful!",
          style: TextStyle(
            fontSize: 21,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Your payment has been processed successfully.",
          style: TextStyle(fontSize: 16, color: color),
        ),
        SizedBox(
          height: Get.height * 0.18,
          child: Card(
            color: bgColor,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Details",
                    style: TextStyle(
                      fontSize: 18,
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildRow(title: "Amount Paid", price: 140),
                  _buildType(title: "Date", type: "15-Oct-2025"),
                  _buildType(title: "Payment Method", type: "Mock/Cash"),
                ],
              ),
            ),
          ),
        ),
        buildButton(
          title: "Back To Home",
          color: Colors.orange,
          onTap: () {
            controller.changeBottomIndex(index: 0);
            Get.offAll(MainScreen());
          },
        ),
        buildButton(
          title: "View Payment History",
          color: Colors.blueGrey,
          onTap: () {
            controller.changeBottomIndex(index: 3);
            Get.to(PaymentHistoryScreen());
          },
        ),
      ],
    ),
  );
}

Widget buildButton({
  required String title,
  required Color color,
  required Function() onTap,
}) {
  return SizedBox(
    height: Get.height * 0.05,
    width: double.infinity,
    child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onTap,
      textColor: Colors.white,
      color: color,
      child: Text(
        title,
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget _buildRow({required String title, required double price}) {
  var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      Text(
        "\$${price.toStringAsFixed(2)}",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    ],
  );
}

Widget _buildType({required String title, required String type}) {
  var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      Text(
        type,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    ],
  );
}
