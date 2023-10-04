import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../services/service.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  
  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData();
    if (response.statusCode == 200) {
      _myData = response.body;
      if (kDebugMode) {
        print('we got the data');
      }
      update();
    } else {
      if (kDebugMode) {
        print('we did not  get any data');
      }
    }
  }

   Future<void> postData(String task, String taskDetail) async {
    _isLoading = true;
    Response response = await service.postData({
      'task_name':task,
      'task_detail':taskDetail,
    });
    if (response.statusCode == 200) {
  //    _myData = response.body;
      if (kDebugMode) {
        print('data post successfull');
      }
      update();
    } else {
      if (kDebugMode) {
        print('data post failed');
      }
    }
  }
}
