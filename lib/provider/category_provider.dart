import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
    //------------------- var ---------------//
  CategoryModel? _categoryModel;

    //------------------- getter/ setter ---------------//

  CategoryModel? get categoryModel => _categoryModel;

  set categoryModel(CategoryModel? value) {
    _categoryModel = value;
    notifyListeners();
  }

  //----------------------- function-----------------------//

  Future<void> fetchCategoryData() async {
    try {
      final response = await http.get(
        Uri.parse('https://app-interview.easyglue.in/category_repository.json'),
      );
      if (response.statusCode == 200) {
       categoryModel = categoryModelFromJson(response.body);
        notifyListeners();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}