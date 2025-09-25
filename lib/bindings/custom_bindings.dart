import 'package:get/get.dart';
import 'package:workout_tracker/screens/login_screen/controller/login_controller.dart';
import 'package:workout_tracker/screens/sign_up_screen/controller/sing_up_controller.dart';

class CustomBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
  }
}
