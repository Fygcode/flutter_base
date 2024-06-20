import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_node/core/enum/view_state.dart';
import 'package:stacked_node/core/res/spacing.dart';
import 'package:stacked_node/core/res/styles.dart';
import 'package:stacked_node/locator.dart';
import 'package:stacked_node/ui/views/signUp/signUp_provider.dart';
import 'package:stacked_node/ui/widgets/button.dart';
import 'package:stacked_node/ui/widgets/edit_text_field.dart';

import '../../../router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupProvider>(
      create: (context) => SignupProvider(),
      child: Consumer<SignupProvider>(
        builder: (context, model, child) {
          return SafeArea (
            child: Scaffold(
                body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: model.signUpKey,
                child: Column(
                  children: [
                    Text(
                      "Welcome to Flutter Node App",
                      style: AppTextStyle.purpose.copyWith(color: Colors.black),
                    ),
                    VerticalSpacing.custom(value: 10),
                    EditTextField("Enter Name", model.userNameController),
                    EditTextField("Enter Email", model.emailController),
                    EditTextField("Enter Password", model.passwordController),
                    EditTextField("Enter Cdvds  onfirm Password",
                        model.confirmPasswordController),
                    VerticalSpacing.d10px(),
                    Button(
                      "Sign Up",
                      key: const ValueKey("btnLogin"),
                      width: double.infinity,
                      isLoading: model.state == ViewState.Busy,
                      onPressed: () {
                        model.signUp();
                      },
                    ),
                    VerticalSpacing.d12px(),
                    InkWell(
                        onTap: () {
                          navigationService.pushNamed(Routes.signIn);
                        }, child: Text("Already Have an account!")),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
