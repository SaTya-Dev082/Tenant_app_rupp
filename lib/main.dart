import 'package:flutter/material.dart';

import 'main_screen/screens/home_screen.dart';

void main() => runApp(TenantApp());

class TenantApp extends StatelessWidget {
  const TenantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
