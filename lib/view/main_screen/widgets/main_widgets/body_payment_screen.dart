import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tenant_app/controller/home_controller.dart';
import 'package:tenant_app/view/main_screen/widgets/sub_widgets/sub_payment_screen/payment_success_screen.dart';

final box = GetStorage();
final controller = Get.find<HomeController>();

class buildBodyPaymentScreen extends StatelessWidget {
  const buildBodyPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: GetBuilder<HomeController>(
          builder:
              (controller) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  spacing: 10,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Payment",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          color: color,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Card(
                      child: Container(
                        height: Get.height * 0.33,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8.2,
                            children: [
                              Text(
                                "Monthly Bill Summary",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                              ),
                              Divider(),
                              _buildRow(title: "Room Rent", price: 100.00),
                              _buildRow(title: "Water", price: 15),
                              _buildRow(title: "Electricity", price: 20),
                              _buildRow(title: "Trash", price: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Moto Parking",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: color,
                                    ),
                                  ),
                                  Switch(
                                    activeColor: Colors.white,
                                    activeTrackColor: Colors.green,
                                    inactiveThumbColor: Colors.blue,
                                    focusColor: Colors.yellow,
                                    value: controller.isMotoParking,
                                    onChanged: (value) {
                                      controller.changeParking(value);
                                      print(controller.isMotoParking);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.14,
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15, left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 7,
                            children: [
                              Text(
                                "Total Amount",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: color,
                                ),
                              ),
                              Text(
                                "\$140.00",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                  color: color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                      width: double.infinity,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          Get.to(PaymentSuccessScreen());
                        },
                        textColor: Colors.white,
                        color: Colors.orange,
                        child: Text(
                          "Pay Now",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Payment Method",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: color,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ABA Bank / Cash / Mock Payment",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: color,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.credit_card_rounded,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}

Widget _buildRow({required String title, required double price}) {
  var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      Text(
        "\$${price.toStringAsFixed(2)}",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    ],
  );
}
