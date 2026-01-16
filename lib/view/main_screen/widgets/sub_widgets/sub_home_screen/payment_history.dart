import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../controller/home_controller.dart';
import '../../../screens/main_screen.dart';

class PaymentHistoryScreen extends StatefulWidget {
  PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  final HomeController controller = Get.find();

  final box = GetStorage();
  int selectedIndex = 0;

  List<Map<String, dynamic>> datePaid = [
    {"id": 0, "month": "All"},
    {"id": 1, "month": "Jan"},
    {"id": 2, "month": "Feb"},
    {"id": 3, "month": "Mar"},
    {"id": 4, "month": "Apr"},
    {"id": 5, "month": "May"},
    {"id": 6, "month": "Jun"},
    {"id": 7, "month": "Jul"},
    {"id": 8, "month": "Agu"},
  ];

  @override
  Widget build(BuildContext context) {
    var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
    var bgColor =
        box.read("theme") != "dark" ? Color(0XFFFFFFFF) : Color(0XFF282727);
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment History"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
            MainScreen();
          },
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: Get.height * 0.05,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: datePaid.length,
              itemBuilder: (context, index) {
                final date = datePaid[index];
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                        if (date["id"] == 0) {
                        } else {}
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Chip(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          label: Text(
                            date["month"],
                            style: TextStyle(fontSize: 17),
                          ),

                          backgroundColor:
                              selectedIndex == index
                                  ? Colors.blue
                                  : Colors.transparent,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          SizedBox(height: Get.height * 0.8, child: buildPaymentHistory()),
        ],
      ),
    );
  }

  Widget buildPaymentHistory() {
    final color = controller.isDarkMode ? Colors.black : Colors.white;
    final colorItem = controller.isDarkMode ? Colors.white : Colors.black;
    return CustomScrollView(
      slivers: [
        // ================= STATIC SECTION =================
        SliverToBoxAdapter(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 7,
                    children: [
                      Text(
                        "Total Paid This Year",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: colorItem,
                        ),
                      ),
                      Text(
                        "Paid on 15-Oct-2026",
                        style: TextStyle(fontSize: 16, color: colorItem),
                      ),
                      Text(
                        "\$150.00",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.8,
                          color: colorItem,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 7,
                    children: [
                      MaterialButton(
                        height: 30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {},
                        color: Colors.green,
                        child: Text(
                          "Paid",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_right_alt_outlined,
                          color: colorItem,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // ================= LIST SECTION =================
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 10, // ⭐ many items
            (context, index) {
              return SizedBox(
                height: Get.height * 0.125,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 7,
                          children: [
                            Text(
                              "Month Rent",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: colorItem,
                              ),
                            ),
                            Text(
                              "Paid on 15-Oct-2026",
                              style: TextStyle(fontSize: 16, color: colorItem),
                            ),
                            Text(
                              "\$150.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.8,
                                color: colorItem,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 7,
                          children: [
                            MaterialButton(
                              height: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () {},
                              color: Colors.green,
                              child: Text(
                                "Paid",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_right_alt_outlined,
                                color: colorItem,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
