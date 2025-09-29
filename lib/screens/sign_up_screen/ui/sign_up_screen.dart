import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/sing_up_controller.dart';

class SignUpScreen extends GetView<SignUpController> {
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
                  controller: controller.nameController,
                  keyboardType: TextInputType.name,
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
                  controller: controller.emailController,
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
                  controller: controller.phoneController,
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
                  controller: controller.genderController,
                  readOnly: true,
                  onTap: () {
                    Get.dialog(
                      AlertDialog(
                        title: Text("Select Gender"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: Text("Male"),
                              onTap: () => controller.selectGender("Male"),
                            ),
                            ListTile(
                              title: Text("Female"),
                              onTap: () => controller.selectGender("Female"),
                            ),
                            ListTile(
                              title: Text("Other"),
                              onTap: () => controller.selectGender("Other"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: "Please select your gender",
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
                  controller: controller.dobController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                          "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";

                      controller.dobController.text = formattedDate;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Please select your DOB",
                    suffixIcon: Icon(Icons.calendar_today),
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
                Obx(
                  () => TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.isObscure.value,
                    decoration: InputDecoration(
                      hintText: "Please enter your password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.isObscure.value =
                              !controller.isObscure.value;
                        },
                        icon: controller.isObscure.value
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                    ),
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
                      controller.validation();
                    },
                    child: Text("Sign up"),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you already have an account?"),
                    Text(" Sign Up"),
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
