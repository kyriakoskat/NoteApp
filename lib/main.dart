import 'package:flutter/material.dart';
import 'screens/opening_page.dart';
import 'screens/sign_in_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpeningPage(),
      routes: {
        '/signIn': (context) => SignInPage()
      },
    );
  }
}

