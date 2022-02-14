import 'package:flutter/material.dart';
import 'package:flutter_task/signin.dart';
import 'package:flutter_task/splash_screen.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Task',
      home: IntroScreen(),
    );
  }
}

class Splash2 extends StatelessWidget {
  const Splash2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 600,
      navigateAfterSeconds: const SignIn(),
      image: Image.asset(
        'assets/images/Splash_animated.gif',
        fit: BoxFit.cover,
      ),
      photoSize: 200.0,
    );
  }
}
