import 'package:flutter/cupertino.dart';
import 'package:stacked_node/helper/utils/form_field_controller.dart';
import 'package:stacked_node/ui/base_model.dart';

class SignInProvider extends BaseModel{


  final GlobalKey<FormState> signInKey = GlobalKey<FormState>();


  EmailFormFieldController emailController = EmailFormFieldController(const ValueKey("signInEmail"),required: true);
  TextFormFieldController passwordController = TextFormFieldController(const ValueKey("signInPassword"),required: true);


}