import 'package:flutter/material.dart';

import '../widgets/main_widgets/body_payment_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildBodyPaymentScreen());
  }
}
