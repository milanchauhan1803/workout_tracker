import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/screens/login_screen/ui/login_screen.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  RxBool isObscure = true.obs;

  void validation() {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String phone = phoneController.text.trim();
    String dob = dobController.text.trim();
    String gender = genderController.text.trim();

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
    } else if (phone.isEmpty) {
      Get.snackbar("Error", "Please enter your phone number");
      return;
    } else if (phone.length != 10) {
      Get.snackbar("Error", "Please enter a valid phone number");
    }else if (gender.isEmpty){
      Get.snackbar("Error", "Please select your gender");
  }else if (dob.isEmpty) {
      Get.snackbar("Error", "Please enter your date of birth");
      return;
    } else if (password.isEmpty) {
      Get.snackbar("Error", "Please enter your password");
      return;
    } else if (password.length < 6) {
      Get.snackbar("Error", "Please enter a valid password");
    } else {
      singUp();
    }
  }

  Future<void> singUp() async {
    try {
      final db = FirebaseFirestore.instance;
      final user = db.collection("users").doc();
      await user.set(<String, dynamic>{
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "phone": phoneController.text,
        "dob": dobController.text,
        "gender": genderController.text,
      });

      nameController.clear();
      emailController.clear();
      passwordController.clear();
      phoneController.clear();
      dobController.clear();
      genderController.clear();
      Get.snackbar("Success", "Account created successfully");
      Get.to(LoginScreen());
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    }
  }

  void selectGender(String gender) {
    genderController.text = gender;
    Get.back(); // dialog band ho jayega
  }
}