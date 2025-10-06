import 'package:get/get.dart';

class HomeController extends GetxController{
  var isWorkoutAdded = false.obs;
  var currentIndex = 1.obs;

  // Dummy workout_screen data
  var workoutTitle = "Afternoon workout_screen 💪".obs;
  var workoutTime = "2min".obs;
  var workoutVolume = "1,260 kg".obs;

  void changeTab(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed('/home');
        break;
      case 1:
        Get.offAllNamed('/workout');
        break;
      case 2:
        Get.offAllNamed('/profile');
        break;
    }
  }
}