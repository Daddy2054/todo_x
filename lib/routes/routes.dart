import 'package:get/get.dart';
import 'package:todo_x/screens/all_tasks.dart';
import 'package:todo_x/screens/edit_task.dart';
import 'package:todo_x/screens/home_screen.dart';
import 'package:todo_x/screens/view_task.dart';

import '../screens/add_task.dart';

class RoutesClass {
  static String home = '/';
  static String allTasks = '/allTasks';
  static String addTask = '/addTask';
  static String editTask = '/editTask';
  static String viewTask = '/viewTask';

  static String getHomeRoute() => home;
  static String getAllTasksRoute() => allTasks;
  static String getAddTaskRoute() => addTask;
  static String getEditTaskRoute(String id) => '$editTask?id=$id';
  static String getViewTaskRoute(String id) => '$viewTask?id=$id';

  static List<GetPage> routes = [
    GetPage(
      page: () => const HomeScreen(),
      name: home,
    ),
    GetPage(
      page: () => const AllTasks(),
      name: allTasks,
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      page: () => const AddTask(),
      name: addTask,
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      page: () {
        var id = Get.parameters['id'];
        return EditTask(id: int.parse(id!));
      },
      name: editTask,
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      page: () {
        var id = Get.parameters['id'];
        return ViewTask(id: int.parse(id!));
      },
      name: viewTask,
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
