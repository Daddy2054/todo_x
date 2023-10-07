import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData(String uri) async {
    if (kDebugMode) {
      print(uri);
    }
    Response response = await get(
      uri,
      // android dont want localhost, use ip from network
      // "http://172.20.10.12:8082/gettasks",   //iphone hotspot
//      "http://192.168.0.149:8082/gettasks",  // local network

      headers: {"Content-Type": "application/json"},
    );
    return response;
  }

  Future<Response> postData(
    String uri,
    dynamic body,
  ) async {
    Response response = await post(
      uri,
      // android dont want localhost, use ip from network
//      "http://192.168.0.149:8082/create",
      body,
      headers: {"Content-Type": "application/json"},
    );
    return response;
  }

   Future<Response> updateData(
    String uri,
    dynamic body,
  ) async {
    Response response = await put(
      uri,
      body,
      headers: {"Content-Type": "application/json"},
    );
    return response;
  }

     Future<Response> deleteData(
    String uri,
  ) async {
    Response response = await delete(
      uri,
      headers: {"Content-Type": "application/json"},
    );
    return response;
  }
}
