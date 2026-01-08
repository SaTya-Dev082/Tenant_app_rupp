import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import '../../../../../controller/home_controller.dart';

class buildPaymentMethod extends StatelessWidget {
  buildPaymentMethod({super.key});
  final box = GetStorage();
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
    return GetBuilder<HomeController>(
      builder:
          (controller) => Scaffold(
            appBar: AppBar(
              title: Text(
                "Payment Methods",
                style: TextStyle(
                  fontSize: 20,
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_outlined, size: 25, color: color),
              ),
            ),
            body: Column(
              spacing: 10,
              children: [
                buildCard(
                  onTap: () {
                    print("ACLEDA");
                  },
                  image: "assets/images/acleda.png",
                  title: "ACLEDA",
                  subTitle: "បង់លុយជាមួយអេស៊ីលីដា",
                  height: 50,
                ),
                buildCard(
                  onTap: () {
                    print("ABA");
                  },
                  image: "assets/images/aba.png",
                  title: "ABA KHQR",
                  subTitle: "បង់លុយជាមួយអេបីអេ",
                  height: 50,
                ),
                buildCard(
                  onTap: () {
                    print("Master Card");
                  },
                  image: "assets/images/mastercard.png",
                  title: "Master Card",
                  subTitle: "បង់លុយជាមួយម៉ាស្ទ័រកាត",
                  height: 50,
                ),
              ],
            ),
          ),
    );
  }

  buildCard({
    required String image,
    required String title,
    required String subTitle,
    required Function onTap,
    double height = 50,
    double width = 70,
  }) {
    var color = box.read("theme") == "dark" ? Colors.white : Colors.black;
    var bgColor =
        box.read("theme") != "dark" ? Color(0XFFFFFFFF) : Color(0XFF282727);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: bgColor,
        onTap: () {
          onTap();
        },
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: height,
              width: width,
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(
            fontSize: 18,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
