import 'package:flutter/material.dart';
import 'package:mitchkoko_flutter_tutorial/pages/register_page.dart';
import 'package:mitchkoko_flutter_tutorial/pages/login_page.dart';
import 'package:mitchkoko_flutter_tutorial/pages/home_page.dart'; // Import the home page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        '/loginpage': (context) => LoginPage(),
        '/registerpage': (context) => RegisterPage(),
        '/homepage': (context) => HomePage(), // Add the home page route
      },
    );
  }
}
