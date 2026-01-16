import 'package:flutter/material.dart';
import 'package:tenant_app/view/main_screen/widgets/main_widgets/body_maintenance_screen.dart';

import '../sub_maintenance_screen/overlay_widget.dart';

class MaintenanceRequestScreen extends StatelessWidget {
  const MaintenanceRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: bodyMaintenanceScreen());
  }
}
