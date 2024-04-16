import 'dart:async';

import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),() {
     Navigator.pushReplacementNamed(context, 'home');

    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff12163C), Color(0xff75C3A1)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/festival-removebg-preview.png",
                        color: Colors.white,
                        height: 300,
                        width: 300,
                      ),
                      Text(
                        "Festival Poster Maker",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
