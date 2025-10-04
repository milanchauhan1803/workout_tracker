import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_tracker/screens/home_screen/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21), // Deep Navy background
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        elevation: 0,
        leading: PopupMenuButton<String>(
          icon: Row(
            children: const [
              Text("Home", style: TextStyle(color: Colors.white)),
              Icon(Icons.arrow_drop_down, color: Colors.white),
            ],
          ),
          onSelected: (value) {},
          itemBuilder: (context) => [
            const PopupMenuItem(value: "home", child: Text("Home")),
            const PopupMenuItem(value: "workout", child: Text("Workout")),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_outlined,
                  color: Colors.white)),
        ],
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              // If no workout -> Show Add Workout Button
              if (!controller.isWorkoutAdded.value)
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "No workout started yet",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // Navigate to AddWorkoutScreen
                            // Get.to(() => const AddWorkoutScreen());
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Start Workout"),
                        ),
                      ),
                    ],
                  ),
                ),

              // If workout is added -> Show Workout Card
              if (controller.isWorkoutAdded.value)
                Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Header row
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundImage:
                            NetworkImage("https://i.pravatar.cc/150?img=3"),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "fitwithmi18",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("2 minutes ago",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.more_horiz, color: Colors.white70),
                        ],
                      ),
                      const SizedBox(height: 10),

                      /// Title
                      Text(
                        controller.workoutTitle.value,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10),

                      /// Stats Row
                      Row(
                        children: [
                          const Text("Time ",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 14)),
                          Text(controller.workoutTime.value,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14)),
                          const SizedBox(width: 20),
                          const Text("Volume ",
                              style:
                              TextStyle(color: Colors.grey, fontSize: 14)),
                          Text(controller.workoutVolume.value,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 15),

                      /// Workout Image
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            "https://img.icons8.com/ios-filled/100/ffffff/deadlift.png",
                            height: 60,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "2 sets Bent Over Row (Barbell)",
                            style:
                            TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      /// Action Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(Icons.thumb_up_alt_outlined,
                              color: Colors.white70, size: 22),
                          Icon(Icons.chat_bubble_outline,
                              color: Colors.white70, size: 22),
                          Icon(Icons.share_outlined,
                              color: Colors.white70, size: 22),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          );
        }),
      ),

      /// Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0A0E21),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: "Workout"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}