// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mitchkoko_flutter_tutorial/components/my_button.dart';
import 'package:mitchkoko_flutter_tutorial/components/textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign user up method
  void signUserUp() {}

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
                  // logo
                  Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 50),

                  // email textfield
                  MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                    icons: Icon(Icons.person),
                  ),

                  SizedBox(height: 25),

                  // password textfield
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                    icons: Icon(Icons.lock),
                  ),

                  SizedBox(height: 25),

                  // confirm password textfield
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                    icons: Icon(Icons.lock),
                  ),

                  SizedBox(height: 10),

                  SizedBox(height: 25),

                  // sign up button
                  MyButton(text: "R E G I S T E R", onTap: signUserUp),

                  // Already a member, Login now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? '),
                      TextButton(
                        onPressed: () {
                          // navigate to login page
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
