import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:tenant_app/controller/home_controller.dart';
import 'binding/home_binding.dart';
import 'constants/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(HomeController());
  runApp(TenantApp());
}

class TenantApp extends StatelessWidget {
  TenantApp({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      themeMode: box.read("theme") != "dark" ? ThemeMode.light : ThemeMode.dark,
      initialRoute: "/",
      getPages: getPages,
    );
  }
}


/// Test push to github
void test() {
  print("This is a test function.");
}