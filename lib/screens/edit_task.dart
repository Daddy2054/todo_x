import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_x/controllers/data_controller.dart';
import 'package:todo_x/utils/app_colors.dart';
import 'package:todo_x/widgets/button_widget.dart';
import 'package:todo_x/widgets/error_warning_ms.dart';
import 'package:todo_x/widgets/textfield_widget.dart';

import '../routes/routes.dart';

class EditTask extends StatelessWidget {
  final int id;
  const EditTask({
    Key? key,
    required this.id,
  }) : super(key: key);

  loadSingleTask() async {
    if (kDebugMode) {
      print('passed id is $id');
    }
    await Get.find<DataController>().getSingleData(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    loadSingleTask();
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool dataValidation() {
      if (nameController.text.trim() == '') {
        Message.taskErrorOrWarning(
          'Task name',
          'Your task name is empty',
        );
        return false;
      } else if (detailController.text.trim() == '') {
        Message.taskErrorOrWarning(
          'Task detail',
          'Your task detail is empty',
        );
        return false;
      } else if (nameController.text.length <= 10) {
        Message.taskErrorOrWarning(
          'Task name',
          'Your task name should be at least 10 characters',
        );
        return false;
      } else if (detailController.text.length <= 20) {
        Message.taskErrorOrWarning(
          'Task detail',
          'Your task detail should be at least 20 characters',
        );
        return false;
      }
      return true;
    }

    return Scaffold(
      body: GetBuilder<DataController>(
        builder: (controller) {
          nameController.text =
              controller.singleData['task_name'] ?? 'Task name not found';
          detailController.text =
              controller.singleData['task_detail'] ?? 'Task detail not found';
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/addtask1.jpg',
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    IconButton(
                      onPressed: () => Get.back(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextFieldWidget(
                      textController: nameController,
                      hintText: 'Task name',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      textController: detailController,
                      hintText: 'Task detail',
                      borderRadius: 15,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (dataValidation()) {
                          Get.find<DataController>().updateData(
                            nameController.text.trim(),
                            detailController.text.trim(),
                            int.parse(controller.singleData['id']),
                          );
                        Get.offNamed(
                        RoutesClass.getAllTasksRoute(),
                      );
                        }
                      },
                      child: const ButtonWidget(
                        backgroundcolor: AppColors.mainColor,
                        text: 'Add',
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
