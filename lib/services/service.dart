import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData() async {
    Response response = await get(
      // android dont want localhost, use ip from network
      "http://172.20.10.12:8082/gettasks",
      headers: {"Content-Type": "application/json"},
    );
    return response;
  }
}
