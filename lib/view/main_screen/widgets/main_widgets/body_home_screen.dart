import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../controller/home_controller.dart';
import '../sub_widgets/sub_home_screen/maintenance_request.dart';
import '../sub_widgets/sub_home_screen/make_payment.dart';
import '../sub_widgets/sub_home_screen/my_lease.dart';
import '../sub_widgets/sub_home_screen/payment_history.dart';

final HomeController controller = Get.find();
final box = GetStorage();

// Body Home Screen Widget
Widget buildBodyHomeScreen() {
  var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
  var bgColor =
      box.read("theme") != "dark" ? Color(0XFFFFFFFF) : Color(0XFF282727);
  return SafeArea(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          spacing: 5,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://lh3.googleusercontent.com/283R1jiggMt5OuWdSh_sIihevv3dc-2UMaX7Rkiq-ACumEHjTgiO75Q_EEh7HFQvdAmJruxzgEBJiEs8=w544-h544-l90-rj",
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Welcome, User",
                    style: TextStyle(fontSize: 20, color: color),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_active_outlined),
                ),
              ],
            ),
            Card(
              color: bgColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Room R203",
                      style: TextStyle(
                        fontSize: 19,
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.circle, color: Colors.green, size: 15),
                        SizedBox(width: 5),
                        Text(
                          "Active Lease",
                          style: TextStyle(fontSize: 16, color: color),
                        ),
                      ],
                    ),
                    Text(
                      "Next Payment Due: 15 Oct 2025",
                      style: TextStyle(fontSize: 16, color: color),
                    ),
                    Text(
                      "\$150.00",
                      style: TextStyle(
                        fontSize: 21,
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {},
                        height: 43,
                        textColor: Colors.white,
                        color: Colors.orange,
                        child: Text(
                          "Pay Now",
                          style: TextStyle(
                            fontSize: 21,
                            // color: color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.245,
              width: double.infinity,
              child: buildBlockFeature(),
            ),
            buildMaintenanceStatus(),
            buildAnnouncement(),
          ],
        ),
      ),
    ),
  );
}

// Block feature (Make payment, Payment history, Maintenance request, My lease)

List features = [
  {
    "icon": Icons.payment_rounded,
    "text": "Make Payment",
    "onTap": () {
      Get.to(() => MakePaymentScreen());
    },
  },
  {
    "icon": Icons.payments_rounded,
    "text": "Payment History",
    "onTap": () {
      Get.to(() => PaymentHistoryScreen());
    },
  },
  {
    "icon": Icons.build_rounded,
    "text": "Maintenance Request",
    "onTap": () {
      Get.to(() => MaintenanceRequestScreen());
    },
  },
  {
    "icon": Icons.text_snippet_sharp,
    "text": "My Lease",
    "onTap": () {
      Get.to(() => MyLeaseScreen());
    },
  },
];
Widget buildBlockFeature() {
  var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
  return GridView.builder(
    itemCount: features.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 8.2,
      crossAxisSpacing: 8.2,
      childAspectRatio: 5 / 2.8,
    ),
    itemBuilder: (context, index) {
      final feature = features[index];
      return InkWell(
        onTap: () {
          feature["onTap"]();
          print(feature["text"]);
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Icon(feature["icon"], color: Colors.orange, size: 30),
              Text(
                feature["text"],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// Block Maintenance Status
Widget buildMaintenanceStatus() {
  var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
  return SizedBox(
    height: Get.height * 0.14,
    width: double.infinity,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.2,
          children: [
            Text(
              "Maintenance Status",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              "No active maintenance requests",
              style: TextStyle(fontSize: 17, color: color),
            ),
          ],
        ),
      ),
    ),
  );
}

// Block Announcement
Widget buildAnnouncement() {
  var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
  return SizedBox(
    height: Get.height * 0.18,
    width: double.infinity,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8.2,
          children: [
            Text(
              "Announcements",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              "● Water maintenance on Oct 20",
              style: TextStyle(fontSize: 17, color: color),
            ),
            Text(
              "● Trash collection schedule changed",
              style: TextStyle(fontSize: 17, color: color),
            ),
          ],
        ),
      ),
    ),
  );
}
