import 'package:kamui_crypto_price_analyser/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}


class Application extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
