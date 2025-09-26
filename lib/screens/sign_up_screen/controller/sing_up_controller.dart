import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  void signUp() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String phone = phoneController.text.trim();
    String dob = dobController.text.trim();

    if (name.isEmpty) {
      Get.snackbar("Error", "Please enter your name");
      return;
    } else if (name.length < 3) {
      Get.snackbar("Error", "Please enter a valid name");
    } else if (email.isEmpty) {
      Get.snackbar("Error", "Please enter your email");
      return;
    } else if (!GetUtils.isEmail(email)) {
      Get.snackbar("Error", "Please enter a valid email");
    } else if (dob.isEmpty) {
      Get.snackbar("Error", "Please enter your date of birth");
      return;
    } else if (dob.length != 10) {
      Get.snackbar("Error", "Please enter a valid date of birth");
    }
    else if (password.isEmpty) {
      Get.snackbar("Error", "Please enter your password");
      return;
    } else if (password.length < 6) {
      Get.snackbar("Error", "Please enter a valid password");
    } else if (phone.isEmpty) {
      Get.snackbar("Error", "Please enter your phone number");
      return;
    } else if (phone.length != 10) {
      Get.snackbar("Error", "Please enter a valid phone number");
    } else {
      Get.snackbar("Success", "Account created successfully");
    }
  }
}
