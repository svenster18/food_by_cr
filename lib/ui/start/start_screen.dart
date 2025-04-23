import 'package:flutter/material.dart';
import 'package:food_by_cr/ui/start/start_mobile_page.dart';
import 'package:food_by_cr/ui/start/start_web_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1200) {
          return StartWebPage();
        } else {
          return StartMobilePage();
        }
      },
    );
  }
}
