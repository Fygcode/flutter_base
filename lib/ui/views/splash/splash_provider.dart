// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_node/ui/base_model.dart';
//
// import '../../../locator.dart';
// import '../../../router.dart';
// import '../../../services/api_base_service.dart';
//
// class SplashProvider extends BaseModel{
//
//   apiCall() async{
//     print("Api Call here");
//   }
//
//   void sendData() async {
//     try {
//       final data = {
//         'key1': 'value1',
//         'key2': 'value2',
//         'key3': 'value3',
//       };
//
//       final response = await ApiService.request('your-endpoint', method: 'POST', data: data);
//       print(response);
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   void uploadFile() async {
//     try {
//       final fields = {
//         'field1': 'value1',
//         'field2': 'value2',
//       };
//       final file = File('path/to/your/file');
//
//       final response = await ApiService.postMultipart('your-endpoint', fields, file);
//       print(response);
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
// }

import 'package:flutter/material.dart';
import 'package:stacked_node/core/model/todo_model.dart';
import 'package:stacked_node/core/model/user_model.dart';
import 'package:stacked_node/locator.dart';
import 'package:stacked_node/router.dart';
import 'package:stacked_node/services/api_base_service.dart';
import 'package:stacked_node/services/request_method.dart';

import '../../../core/enum/view_state.dart';
import '../../base_model.dart';

class SplashProvider extends BaseModel {

  SplashProvider() {
    print("SplashProvider constructor");
    init();
//    apiCall();
 //   sendData();
   // getSingleData();
  }


  Future<void> init() async {
    // Mocking an API call with a delay
  await Future.delayed(const Duration(seconds: 2));
    navigationService.popAllAndPushNamed(Routes.home);
  }

  Future<void> apiCall() async {
    print("Api Call function");

    await Future.delayed(const Duration(seconds: 2));

    // Ensure the navigation action is scheduled after the current frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigationService.popAllAndPushNamed(Routes.home);
    });
  }






  List<UserModel> userModel = [];

  void sendData() async {
    try {
      setState(ViewState.Busy);
      List<UserModel> response = await ApiBaseService.requestList<UserModel>('/users', method: RequestMethod.GET,);
      setState(ViewState.Idle);
      if (response != null) {
        for (var user in response) {
          print('ID: ${user.id}, Name: ${user.name}');
        }
        userModel = response;
        notifyListeners();
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  void getSingleData() async {
    try {
      setState(ViewState.Busy);
      TodoModel response = await ApiBaseService.request<TodoModel>('/todos/1', method: 'GET');
      setState(ViewState.Idle);
      if (response != null) {
        print("===++ ${response.title}");
      }
    } catch (e) {
      print('Error: $e');
    }
  }


  Future<void> createUser(Map<String, String> userData) async {
    try {
      var response = await ApiBaseService.request('users', method: 'POST', params: userData);
      print(response);
    } catch (e) {
      print('Error creating user: $e');
    }
  }


  // Future<void> uploadProfilePicture(File imageFile) async {
  //   try {
  //     var response = await apiService.uploadImage(imageFile, 'upload-profile-picture');
  //     print(response);
  //   } catch (e) {
  //     print('Error uploading image: $e');
  //   }
  // }


  // Future<void> uploadImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     File imageFile = File(pickedFile.path);
  //     try {
  //       var response = await apiService.uploadImage(imageFile, 'upload-profile-picture');
  //       print(response);
  //     } catch (e) {
  //       print('Error uploading image: $e');
  //     }
  //   }
  // }



}
