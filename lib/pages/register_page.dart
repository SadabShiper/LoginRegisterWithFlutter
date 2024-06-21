// ignore_for_file: prefer_const_constructors
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mitchkoko_flutter_tutorial/components/my_button.dart';
import 'package:mitchkoko_flutter_tutorial/components/textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://192.168.0.183:3000/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailController.text,
        'password': passwordController.text,
        'confirmPassword': confirmPasswordController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Successful registration
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('You are registered successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushNamed(context, '/loginpage'); // Navigate to login page
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Failed registration
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Error in registration.'),
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
                    "Register",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50),
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
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
                  SizedBox(height: 25),
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    icons: Icon(Icons.lock),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 25),
                  MyButton(
                      text: "R E G I S T E R",
                      onTap: () => signUserUp(context)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? '),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/loginpage');
                        },
                        child: Text(
                          'Login Now',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}