import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_node/core/res/spacing.dart';
import 'package:stacked_node/core/res/styles.dart';
import 'package:stacked_node/ui/views/signIn/signIn_provider.dart';
import 'package:stacked_node/ui/widgets/edit_text_field.dart';

import '../../../core/enum/view_state.dart';
import '../../../locator.dart';
import '../../../router.dart';
import '../../widgets/button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInProvider>(
      create: (context) => SignInProvider(),
      child: Consumer<SignInProvider>(
        builder: (context, model, child) {
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: model.signInKey,
                  child: Column(
                    children: [
                      const Text("Sign In to Continue"),
                      VerticalSpacing.d10px(),
                      EditTextField("Enter Email", model.emailController),
                      EditTextField("Enter Password", model.passwordController),
                      VerticalSpacing.d10px(),
                      Button(
                        "SignIn",
                        key: const ValueKey("btnLogin"),
                        width: double.infinity,
                        isLoading: model.state == ViewState.Busy,
                        onPressed: () {
                      //    model.signUp();
                        },
                      ),
                      VerticalSpacing.d10px(),
                      InkWell(
                          onTap: () {
                            navigationService.pushNamed(Routes.signUp);
                          }, child: Text("Create New Account")),
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
