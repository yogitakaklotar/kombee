import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http ;
import 'package:interview/model/top_view_model.dart';

class HomeProvider extends ChangeNotifier{
  //------------------- var ---------------//
  TopViewModel ?_topViewModel ;
    //------------------- getter/ setter ---------------//
  

TopViewModel? get topViewModel => _topViewModel;


set topViewModel(TopViewModel? value) {
  _topViewModel = value;
}
    //------------------- method ---------------//
 Future<void> fetchTopViewData() async {
  try {
     final response = await http.get(Uri.parse('https://app-interview.easyglue.in/top_repository.json'));
  if(response.statusCode ==200){
       topViewModel = topViewModelFromJson(response.body);
       notifyListeners();
  }
  } catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }
 }

}