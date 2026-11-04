import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/about_us_page.dart';

void main() {
  runApp(const DelicIdApp());
}

class DelicIdApp extends StatelessWidget {
  const DelicIdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DelicId',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF8F3EA),
      ),
      home: const LoginPage(),
      routes: {
        AboutUsPage.tag: (context) => const AboutUsPage(),
      },
    );
  }
}