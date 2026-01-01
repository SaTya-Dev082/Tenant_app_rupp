import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenant_app/controller/home_controller.dart';

import '../../../screens/main_screen.dart';

final HomeController controller = Get.find();
Widget buildPaymentHistory() {
  final color = controller.isDarkMode ? Colors.black : Colors.white;
  final colorItem = controller.isDarkMode ? Colors.white : Colors.black;
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: CustomScrollView(
        slivers: [
          // ================= STATIC SECTION =================
          SliverToBoxAdapter(
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
                        size: 25,
                        color: colorItem,
                      ),
                    ),
                    SizedBox(width: 90),
                    Text(
                      "Payment History",
                      style: TextStyle(fontSize: 21, color: colorItem),
                    ),
                  ],
                ),
                Container(
                  height: Get.height * 0.05,
                  width: Get.width * 0.7,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: DropdownButton<int>(
                      value: controller.selectedId,
                      menuMaxHeight: 250,
                      style: TextStyle(fontSize: 20, color: colorItem),
                      icon: Icon(Icons.calendar_month, color: colorItem),
                      menuWidth: Get.width * 0.4,
                      dropdownColor: color,
                      alignment: Alignment.center,
                      isExpanded: true,
                      items:
                          controller.dates.map((item) {
                            return DropdownMenuItem<int>(
                              value: item["id"],
                              child: Text(item["data"]),
                            );
                          }).toList(),
                      onChanged: (value) {
                        controller.chooseDate(value!);
                        print("Selected ID: $value");
                      },
                    ),
                  ),
                ),
              ],
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
                                style: TextStyle(
                                  fontSize: 16,
                                  color: colorItem,
                                ),
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
      ),
    ),
  );
}
