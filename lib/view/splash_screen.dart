import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsappapi/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/splash_pic.jpg',
              fit: BoxFit.cover,
              height: height * .5,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Text(
              'NEW AREA',
              style: GoogleFonts.anton(
                  letterSpacing: .6, color: Colors.grey.shade700),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            SpinKitChasingDots(
              color: const Color.fromARGB(255, 51, 137, 207),
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
