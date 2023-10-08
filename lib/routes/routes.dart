import 'package:get/get.dart';
import 'package:todo_x/screens/all_tasks.dart';
import 'package:todo_x/screens/home_screen.dart';

class RoutesClass {
  static String home = '/';
  static String allTasks = '/allTasks';

  static String getHomeRoute() => home;
  static String getAllTasksRoute() => allTasks;

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
  ];
}
