import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditProfileController extends GetxController {
  var imagePath = ''.obs;
  var sex = ''.obs;
  var birthday = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController linkController = TextEditingController();

  void changePicture() {
    // TODO: implement image picker logic
    imagePath.value = 'assets/default_user.png';
  }

  void selectSex() async {
    final result = await Get.dialog(
      SimpleDialog(
        title: const Text('Select Sex'),
        children: [
          SimpleDialogOption(
              onPressed: () => Get.back(result: 'Male'),
              child: const Text('Male')),
          SimpleDialogOption(
              onPressed: () => Get.back(result: 'Female'),
              child: const Text('Female')),
        ],
      ),
    );
    if (result != null) sex.value = result;
  }

  void selectBirthday() async {
    final date = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime(2000),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      birthday.value =
      "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
    }
  }

  void saveProfile() {
    // TODO: Add Firebase or local save logic
    Get.snackbar('Saved', 'Profile updated successfully',
        snackPosition: SnackPosition.BOTTOM);
  }
}
