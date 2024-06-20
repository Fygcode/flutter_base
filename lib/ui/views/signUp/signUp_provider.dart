import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked_node/ui/base_model.dart';

import '../../../core/enum/view_state.dart';
import '../../../core/model/user_model.dart';
import '../../../helper/utils/form_field_controller.dart';
import '../../../services/api_base_service.dart';
import '../../../services/request_method.dart';

class SignupProvider extends BaseModel {
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  NameFormFieldController userNameController = NameFormFieldController(const ValueKey("userNameController"), required: true);
  EmailFormFieldController emailController = EmailFormFieldController(const ValueKey("emailController"),required: true);
  TextFormFieldController passwordController = TextFormFieldController(const ValueKey("passwordController"),required: true);
  TextFormFieldController confirmPasswordController = TextFormFieldController(const ValueKey("confirmPasswordController"),required: true);


  signUp() async {
    if (signUpKey.currentState?.validate() != true) {
      print("Please Fill Field");
      return;
    }
 //   signUpApi();
    notifyListeners();
  }

  // void signUpApi() async {
  //   // Map<String, dynamic> params = {
  //   //   'name': nameController.text,
  //   //   'email': emailController.text
  //   // };
  //   print("=== ${params}");
  //   try {
  //     setState(ViewState.Busy);
  //     print("api calling");
  //     UserModel response = await ApiBaseService.request<UserModel>('/users',
  //         method: RequestMethod.POST, body: params,authenticated: false);
  //     setState(ViewState.Idle);
  //     if (response != null) {
  //       print("flutter testing $response");
  //       Fluttertoast.showToast(msg: "Email Saved to Database Successfully");
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     setState(ViewState.Idle);
  //     print('Error: $e');
  //   }
  // }
}
