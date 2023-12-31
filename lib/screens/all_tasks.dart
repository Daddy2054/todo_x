import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:todo_x/controllers/data_controller.dart';
import 'package:todo_x/routes/routes.dart';
import 'package:todo_x/utils/app_colors.dart';
import 'package:todo_x/widgets/button_widget.dart';
import 'package:todo_x/widgets/task_widget.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    //   print(Get.find<DataController>().myData.length);
    // List myData =  [
    //   'Try harder',
    //   'Try smarter',
    // ];

    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color(0xff2e3253).withOpacity(0.5),
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );

    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<DataController>(
        builder: (controller) {
          return controller.isLoading
              ? SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: SpinKitThreeInOut(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: index.isEven ? Colors.red : Colors.green,
                        ),
                      );
                    },
                  ),
                )
              : Column(
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
                      child: IconButton(
                        onPressed: () => Get.back(),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.secondaryColor,
                        ),
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
                            itemCount: Get.find<DataController>().myData.length,
                            //                itemCount: myData.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                background: leftEditIcon,
                                secondaryBackground: rightDeleteIcon,
                                key: ObjectKey(index),
                                onDismissed: (DismissDirection direction) {
                                  if (kDebugMode) {
                                    print('after dissmiss');
                                  }
                                },
                                confirmDismiss:
                                    (DismissDirection direction) async {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.transparent,
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        builder: (_) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xff2e3253)
                                                  .withOpacity(0.4),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20),
                                              ),
                                            ),
                                            height: 500,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                        RoutesClass
                                                            .getViewTaskRoute(
                                                          controller
                                                              .myData[index]
                                                                  ['id']
                                                              .toString(),
                                                        ),
                                                      );
                                                      if (kDebugMode) {
                                                        print(
                                                            "Tapped item id is ${controller.myData[index]['id']}");
                                                      }
                                                    },
                                                    child: const ButtonWidget(
                                                      backgroundcolor:
                                                          AppColors.mainColor,
                                                      text: 'View',
                                                      textColor: Colors.white,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.toNamed(
                                                        RoutesClass
                                                            .getEditTaskRoute(
                                                          controller
                                                              .myData[index]
                                                                  ['id']
                                                              .toString(),
                                                        ),
                                                      );
                                                      if (kDebugMode) {
                                                        print(
                                                            "Tapped item id is ${controller.myData[index]['id']}");
                                                      }
                                                    },
                                                    child: const ButtonWidget(
                                                      backgroundcolor:
                                                          AppColors.mainColor,
                                                      text: 'Edit',
                                                      textColor: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                    return false;
                                  } else {
                                    controller.deleteData(
                                      int.parse(
                                        controller.myData[index]['id']
                                            .toString(),
                                      ),
                                    );
                                    return Future.delayed(
                                      const Duration(
                                        seconds: 1,
                                      ),
                                      () async {
                                        await controller.getData();
                                        return direction ==
                                            DismissDirection.endToStart;
                                      },
                                    );
                                  }
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 10,
                                  ),
                                  child: TaskWidget(
                                    text: Get.find<DataController>()
                                        .myData[index]["task_name"],
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              );
                            })),
                  ],
                );
        },
      ),
    );
  }
}
