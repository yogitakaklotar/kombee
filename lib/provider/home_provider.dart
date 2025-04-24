

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:interview/model/top_view_model.dart';

import '../model/bottom_view_model.dart';
import '../model/middle_view_model.dart';

class HomeProvider extends ChangeNotifier {
  //------------------- var ---------------//
  TopViewModel? _topViewModel;
  MiddleViewModel? _middleViewModel;
  BottomViewModel? _bottomViewModel;
  //------------------- getter/ setter ---------------//

  TopViewModel? get topViewModel => _topViewModel;

  set topViewModel(TopViewModel? value) {
    _topViewModel = value;
    notifyListeners();
  }

  MiddleViewModel? get middleViewModel => _middleViewModel;

  set middleViewModel(MiddleViewModel? value) {
    _middleViewModel = value;
    notifyListeners();
  }

  BottomViewModel? get bottomViewModel => _bottomViewModel;

  set bottomViewModel(BottomViewModel? value) {
    _bottomViewModel = value;
    notifyListeners();
  }

  //------------------- method ---------------//
  Future<void> fetchTopViewData() async {
    try {
      final response = await http.get(
        Uri.parse('https://app-interview.easyglue.in/top_repository.json'),
      );
      if (response.statusCode == 200) {
        topViewModel = topViewModelFromJson(response.body);
        notifyListeners();
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> fetchMiddleViewData() async {
    try {
      final response = await http.get(
        Uri.parse('https://app-interview.easyglue.in/middle_repository.json'),
      );
      if (response.statusCode == 200) {
        middleViewModel = middleViewModelFromJson(response.body);
        notifyListeners();
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<void> fetchBottomViewData() async {
    try {
      final response = await http.get(
        Uri.parse('https://app-interview.easyglue.in/bottom_repository.json'),
      );
      if (response.statusCode == 200) {
        bottomViewModel = bottomViewModelFromJson(response.body);
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
