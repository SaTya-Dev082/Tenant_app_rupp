import 'package:get/get.dart';

import '../view/main_screen/screens/home_screen.dart';
import '../view/main_screen/screens/main_screen.dart';
import '../view/main_screen/screens/maintenance_screen.dart';
import '../view/main_screen/screens/payment_screen.dart';
import '../view/main_screen/screens/profile_screen.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: '/', page: () => MainScreen()),
  GetPage(name: '/home', page: () => HomeScreen()),
  GetPage(name: '/payment', page: () => PaymentScreen()),
  GetPage(name: '/maintenance', page: () => MaintenanceScreen()),
  GetPage(name: '/profile', page: () => ProfileScreen()),
];
