import 'dart:async';


import 'package:flutter/material.dart';
import 'package:foodreciepe/homescreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => Homescreen()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Image.network(
             "https://t4.ftcdn.net/jpg/06/70/31/45/360_F_670314597_5iQ2ZyYKdgZsgiibFIUqka8sgG8uPIV2.jpg"),
        ),
      ),
    );
  }
}
