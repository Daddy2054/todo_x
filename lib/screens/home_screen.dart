import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_x/routes/routes.dart';
import 'package:todo_x/utils/app_colors.dart';
import 'package:todo_x/screens/all_tasks.dart';
import 'package:todo_x/widgets/button_widget.dart';

import 'add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/welcome.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                text: 'Hello',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: '\nstart your beautiful day',
                    style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            InkWell(
              onTap: () {
                // Get.to(
                //   () => const AddTask(),
                //   transition: Transition.zoom,
                //   duration: const Duration(milliseconds: 500),
                // );
                Get.toNamed(
                  RoutesClass.getAddTaskRoute(),
                );
              },
              child: const ButtonWidget(
                backgroundcolor: AppColors.mainColor,
                text: 'Add Task',
                textColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                //    Get.to(()=>
                //   const AllTasks(),
                //   transition: Transition.fade,
                //   duration: const Duration(seconds: 1),
                // );
                Get.toNamed(
                  RoutesClass.getAllTasksRoute(),
                );
              },
              child: const ButtonWidget(
                backgroundcolor: Colors.white,
                text: 'View All',
                textColor: AppColors.smallTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
