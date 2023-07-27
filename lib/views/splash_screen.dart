import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:note_app/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 3000), () {
      Get.to(HomeScreen());
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/note.png',
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
