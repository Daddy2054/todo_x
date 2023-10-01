import 'package:flutter/material.dart';
import 'package:todo_x/colors/app_colors.dart';
import 'package:todo_x/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
    List myData = [
      'Try harder',
      'Try smarter',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 60,
            ),
            alignment: Alignment.topLeft,
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/header1.jpg',
              ),
              fit: BoxFit.cover,
            )),
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.secondaryColor,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Expanded(child: Container()),
                const Icon(
                  Icons.calendar_month_sharp,
                  color: AppColors.secondaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  '2',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: TaskWidget(
                      text: myData[index],
                      color: Colors.blueGrey,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
