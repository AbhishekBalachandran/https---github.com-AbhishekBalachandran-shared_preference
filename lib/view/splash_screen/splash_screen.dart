import 'package:exam_shared_prefernce/view/login_page/login_page.dart';
import 'package:exam_shared_prefernce/view/registration/registration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Incredible India",
                      style: GoogleFonts.ephesis(
                          fontSize: 55, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "Tourism app",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
