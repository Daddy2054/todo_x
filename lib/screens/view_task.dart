// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_x/controllers/data_controller.dart';

class ViewTask extends StatelessWidget {
  final int id;
  const ViewTask({
    Key? key,
    required this.id,
  }) : super(key: key);

  loadSingleTask() async {
    print('passed id is ' + id.toString());
    await Get.find<DataController>().getSingleData(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    loadSingleTask();
    return const Placeholder();
  }
}
