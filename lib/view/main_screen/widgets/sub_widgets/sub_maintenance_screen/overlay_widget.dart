import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

Widget buildOverlayWidget() {
  var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
  var bgColor =
      box.read("theme") != "dark" ? Color(0XFFFFFFFF) : Color(0XFF2F2F36);
  return SafeArea(
    child: Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: Get.height * 0.365,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Card(
              color: bgColor,
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Icon(Icons.done, color: Colors.white, size: 40),
                    ),
                  ),
                  Text(
                    "Request Submitted!",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  Text(
                    "Your maintenance request has been sent successfully.",
                    style: TextStyle(fontSize: 19, color: color),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Our team will contact you soon.",
                    style: TextStyle(fontSize: 19, color: color),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                    width: Get.width * 0.4,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                      textColor: Colors.white,
                      color: Color(0XFF8AC44B),
                      child: Text(
                        "OK",
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
