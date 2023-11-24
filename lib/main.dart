import 'package:exam_shared_prefernce/controller/login_controller/login_controller.dart';
import 'package:exam_shared_prefernce/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// Question 
// 5. Create a tourism app ui with custom data, passing data between screen.
// Use shared preference login 
// Pages:(Splash,Places,Details)

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
