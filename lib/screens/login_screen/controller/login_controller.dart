import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../home_screen/ui/home_screen.dart';

class LoginController extends GetxController {
  RxBool isObscure = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void validateFields() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields");
    } else if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar("Error", "Please enter a valid email");
    } else if (passwordController.text.length < 6) {
      Get.snackbar("Error", "Password must be at least 6 characters long");
    } else {
      login();
    }
  }

  Future<void> login() async {
    try {
      // Perform login logic here
      var collection = FirebaseFirestore.instance.collection('users');
      var userCredential = await collection
          .where('username', isEqualTo: emailController.text.trim())
          .where('password', isEqualTo: passwordController.text.trim())
          .get();
      // Handle successful login
      print("Login successful: ");
      Get.snackbar("Success", "Login successful");
      // Navigate to the home screen
      Get.offAll(HomeScreen());
    } catch (e) {
      // Handle login error
      Get.snackbar("Error", "Login failed: $e");
    }
  }
}
