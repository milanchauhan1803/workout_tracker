import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/screens/sign_up_screen/ui/sign_up_screen.dart';

import '../controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 7.5),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please enter your email",
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 7.5),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please enter your password",
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 25),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text("Login"),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you already have an account?"),
                    Text(" Add account"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
