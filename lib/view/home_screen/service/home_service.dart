import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:oonzoo_assignment/view/home_screen/model/home_model.dart';

class HomeService {
  Future<List<HomeModel>?> fetchApi() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get("https://fakestoreapi.com/products");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => HomeModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
