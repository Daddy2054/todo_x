// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_x/controllers/data_controller.dart';

import '../utils/app_colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/textfield_widget.dart';

class ViewTask extends StatelessWidget {
  final int id;
  const ViewTask({
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

    return Scaffold(
      body: GetBuilder<DataController>(
        builder: (controller) {
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
                      height: 40,
                    ),
                    IconButton(
                      onPressed: () => Get.back(),
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
                      hintText: '${controller.singleData['task_name']}',
                      readOnly: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                      textController: detailController,
                      hintText: '${controller.singleData['task_detail']}',
                      readOnly: true,
                      borderRadius: 15,
                      maxLines: 3,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // GestureDetector(
                    //   //   onTap: () {
                    //   //   if (dataValidation()) {
                    //   //     Get.find<DataController>().postData(
                    //   //       nameController.text.trim(),
                    //   //       detailController.text.trim(),
                    //   //     );
                    //   //     Get.to(
                    //   //       () => const AllTasks(),
                    //   //       transition: Transition.circularReveal,
                    //   //     );
                    //   //   }
                    //   // },
                    //   child: const ButtonWidget(
                    //     backgroundcolor: AppColors.mainColor,
                    //     text: 'Add',
                    //     textColor: Colors.white,
                    //   ),
                    // ),
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
