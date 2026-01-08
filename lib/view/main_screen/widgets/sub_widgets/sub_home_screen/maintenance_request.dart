import 'package:flutter/material.dart';

import '../sub_maintenance_screen/overlay_widget.dart';

class MaintenanceRequestScreen extends StatelessWidget {
  const MaintenanceRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Maintenance Request")),
      body: buildOverlayWidget(),
    );
  }
}
