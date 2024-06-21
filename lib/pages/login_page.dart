// ignore_for_file: prefer_const_constructors
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mitchkoko_flutter_tutorial/components/my_button.dart';
import 'package:mitchkoko_flutter_tutorial/components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.183:3000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Successful login
      Navigator.pushNamed(context, '/homepage'); // Navigate to home page
    } else {
      // Failed login
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Error while login.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Username',
                    obscureText: false,
                    icons: Icon(Icons.person),
                  ),
                  SizedBox(height: 25),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    icons: Icon(Icons.lock),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  MyButton(text: "L O G I N", onTap: () => signUserIn(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/registerpage');
                        },
                        child: Text(
                          'Register Now',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
