import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tenant_app/controller/home_controller.dart';

import '../sub_widgets/sub_profile_screen/theme_mode_view.dart';

class BodyProfileScreen extends StatelessWidget {
  BodyProfileScreen({super.key});
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final color = controller.isDarkMode ? Colors.white : Colors.black;
    return GetBuilder<HomeController>(
      builder:
          (controller) => Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () async {
                    // navigate to onboarding page
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool("showHome", false);
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(builder: (context) => OnboardingPageView()),
                    // );
                  },
                  icon: Icon(Icons.logout, size: 25, color: color),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "https://lh3.googleusercontent.com/PyL8_EWdYHfBUTfkr285Z3kst9sTYXA5NUXwrahUyVy240Ke6ol93T0z20MGFq1GntZipsTxbkwGzTY=w544-h544-l90-rj",
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -1,
                                right: 5,
                                child: IconButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                      Colors.black87,
                                    ),
                                  ),
                                  onPressed: () {
                                    print("Hi");
                                  },
                                  icon: Icon(
                                    Icons.camera_alt_rounded,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Soeun Norak Satya",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                              ),
                              Text(
                                "soeunnoraksatya@gmail.com",
                                style: TextStyle(fontSize: 16, color: color),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    // Notification section
                    SizedBox(
                      height: 60,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.notifications_active_outlined,
                                    color: color,
                                    size: 30,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Notifications",
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: color,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: Center(
                                  child: Text(
                                    "3",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Likely",
                      style: TextStyle(fontSize: 19, color: color),
                    ),
                    SizedBox(
                      height: 60,
                      child: Card(
                        child: Row(
                          children: [
                            Icon(
                              Icons.language_outlined,
                              color: color,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Language",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                            Spacer(),
                            Text(
                              "English",
                              style: TextStyle(fontSize: 15, color: color),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: color,
                                // size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 60,
                      child: Card(
                        child: Row(
                          children: [
                            Icon(
                              controller.isDarkMode
                                  ? Icons.dark_mode_outlined
                                  : Icons.light_mode_outlined,
                              color: color,
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Mode",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                            Spacer(),
                            Text(
                              controller.isDarkMode ? "Dark" : "Light",
                              style: TextStyle(fontSize: 15, color: color),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.to(ThemeModeView());
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: color,
                                // size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Security",
                      style: TextStyle(fontSize: 19, color: color),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          print("Privacy");
                        },
                        child: Card(
                          child: Row(
                            children: [
                              Icon(
                                Icons.privacy_tip_outlined,
                                color: color,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Privacy",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          print("Help Center");
                        },
                        child: Card(
                          child: Row(
                            children: [
                              Icon(
                                Icons.headset_mic_outlined,
                                color: color,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Help Center",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 60,
                      child: GestureDetector(
                        onTap: () {
                          print("About us");
                        },
                        child: Card(
                          child: Row(
                            children: [
                              Icon(
                                Icons.help_outline_sharp,
                                color: color,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "About us",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: color,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
