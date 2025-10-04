import 'package:get/get.dart';

class HomeController extends GetxController{
  var isWorkoutAdded = false.obs;

  // Dummy workout data
  var workoutTitle = "Afternoon workout 💪".obs;
  var workoutTime = "2min".obs;
  var workoutVolume = "1,260 kg".obs;
}