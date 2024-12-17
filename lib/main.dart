import 'package:flutter/material.dart';
import 'screens/sign_in_page.dart'; // Η σελίδα Sign In
import 'screens/home_page.dart'; // Η σελίδα Home


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Courses App',
      theme: ThemeData(
        primaryColor: const Color(0xFF65558F),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/signIn', // Αρχική οθόνη
      routes: {
        '/signIn': (context) => SignInPage(), // Σελίδα Sign In
        '/home': (context) => HomePage()     // Σελίδα Home
      },
    );
  }
}