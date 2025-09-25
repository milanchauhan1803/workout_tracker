import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/sing_up_controller.dart';

class SignUpScreen extends GetView<SignUpController>{
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Sign up")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 7.5),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please enter your Name",
                  ),
                ),
                SizedBox(height: 15),
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
                  "Phone Number",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 7.5),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please enter your phone number",
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Gender",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 7.5),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please select your gender",
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Phone Number",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 7.5),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please enter your phone number",
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Date Of Birth",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 7.5),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please select your DOB",
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
                    child: Text("Sign up"),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you already have an account?"),
                    Text(" Login"),
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