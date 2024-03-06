import 'package:flutter/material.dart';
import 'package:neon_student/utils/constants/index.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> with TextStyleMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: CustomOverlays.appbarOverlayLight,
        title: Text('Checkout', style: headingStyle()),
        centerTitle: true,
      ),
    );
  }
}
