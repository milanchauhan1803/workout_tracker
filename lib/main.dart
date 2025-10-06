import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/bindings/custom_bindings.dart';
import 'package:workout_tracker/screens/edit_profile_screen/ui/eidt_profile_screen.dart';
import 'package:workout_tracker/screens/home_screen/ui/home_screen.dart';
import 'package:workout_tracker/screens/login_screen/ui/login_screen.dart';
import 'package:workout_tracker/screens/workout_screen/ui/workout_screen.dart';

Future<void> main() async {
  CustomBindings().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
      initialRoute: '/home',

      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/workout', page: () => const WorkoutScreen()),
        GetPage(name: '/profile', page: () => const EditProfileScreen()),
      ],
    );
  }
}
