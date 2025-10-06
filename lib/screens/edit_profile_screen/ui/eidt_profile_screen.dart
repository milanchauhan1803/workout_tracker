import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/edit_profile_controller.dart';


class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Edit Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        actions: [
          TextButton(
            onPressed: controller.saveProfile,
            child: const Text('Done', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            // Profile Picture
            Center(
              child: Column(
                children: [
                  Obx(() => CircleAvatar(
                    radius: 50,
                    backgroundImage: controller.imagePath.isNotEmpty
                        ? AssetImage(controller.imagePath.value)
                        : const AssetImage('assets/default_user.png')
                    as ImageProvider,
                  )),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: controller.changePicture,
                    child: const Text(
                      "Change Picture",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Public Profile Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Public profile data",
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
            ),
            const SizedBox(height: 10),

            _buildTextField("Name", "Your full name",
                controller.nameController, TextInputType.name),

            _buildTextField("Bio", "Describe yourself",
                controller.bioController, TextInputType.text),

            _buildTextField("Link", "https://example.com",
                controller.linkController, TextInputType.url),

            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Text(
                    "Private data",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(width: 6),
                  Icon(Icons.help_outline, color: Colors.grey[600], size: 16),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Sex
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Sex",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Obx(() => TextButton(
                onPressed: controller.selectSex,
                child: Text(
                  controller.sex.value.isEmpty
                      ? "Select"
                      : controller.sex.value,
                  style: const TextStyle(color: Colors.blueAccent),
                ),
              )),
            ),

            // Birthday
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Birthday",
                style: TextStyle(color: Colors.white),
              ),
              trailing: Obx(() => TextButton(
                onPressed: controller.selectBirthday,
                child: Text(
                  controller.birthday.value.isEmpty
                      ? "Select"
                      : controller.birthday.value,
                  style: const TextStyle(color: Colors.blueAccent),
                ),
              )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Workout'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 2, // Profile tab selected
        onTap: (index) {
          // handle navigation with GetX routes
          if (index == 0) Get.toNamed('/home');
          if (index == 1) Get.toNamed('/workout_screen');
          if (index == 2) Get.toNamed('/profile');
        },
      ),
    );
  }

  Widget _buildTextField(String title, String hint,
      TextEditingController controller, TextInputType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: type,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[600]),
            filled: true,
            fillColor: const Color(0xFF1C1C1C),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
