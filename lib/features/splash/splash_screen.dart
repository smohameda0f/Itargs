import 'dart:async';

import 'package:flutter/material.dart';

import '../bottom_nav_bar/bottom-nav-bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => BottomNavBar())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircleAvatar(
            minRadius: 80,
            maxRadius: 100,
            backgroundImage: AssetImage('Assets/Icons/Itargs.jpg')),
      ),
    );
  }
}
