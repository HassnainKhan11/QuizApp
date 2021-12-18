import 'package:flutter/material.dart';
import 'dart:async';
import 'package:quiz_app/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 6), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/splash_512.png'),
          SizedBox(
            height: 40.0,
          ),
          Text("Quizz App",
              style: GoogleFonts.lobster(
                  textStyle: TextStyle(
                color: Color(0xff002fd3),
                fontSize: 46,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ))),
          SizedBox(
            height: 140.0,
          ),
          Text("Let’s check your mind and\nknowledge skills",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: Color(0xff454444),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
              )))
        ],
      )),
    );
  }
}
