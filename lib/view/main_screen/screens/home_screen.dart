import 'package:flutter/material.dart';

import '../widgets/main_widgets/body_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBodyHomeScreen());
  }
}
