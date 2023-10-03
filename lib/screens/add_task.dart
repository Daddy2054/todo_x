import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_x/colors/app_colors.dart';
import 'package:todo_x/widgets/button_widget.dart';
import 'package:todo_x/widgets/textfield_widget.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool _dataValidation() {
      if (nameController.text.trim() == '') {
        Get.snackbar('Task name', 'Task name is empty');
        return false;
      } else if (detailController.text.trim() == '') {
        Get.snackbar('Task detail', 'Task detail is empty');
        return false;
      }
      return true;
    }

    return Scaffold(
      body: Container(
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
                    _dataValidation();
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
      ),
    );
  }
}
