import 'package:flutter/material.dart';

class CourseDetailPage extends StatelessWidget {
  final String subject;

  const CourseDetailPage({required this.subject, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF65558F),
        title: Text(subject),
      ),
      body: Center(
        child: Text(
          "Welcome to $subject Notes!",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
