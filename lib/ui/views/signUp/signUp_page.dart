import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_node/core/enum/view_state.dart';
import 'package:stacked_node/ui/views/signUp/signUp_provider.dart';
import 'package:stacked_node/ui/widgets/button.dart';
import 'package:stacked_node/ui/widgets/edit_text_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupProvider>(
      create: (context) => SignupProvider(),
      child: Consumer<SignupProvider>(
        builder: (context, model, child) {
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: model.signUpKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: model.nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Optional, for rounded corners
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),

                      TextFormField(
                        controller: model.emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Optional, for rounded corners
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),

                      Button(
                        "Sign Up",
                        height: 48,
                        key: const ValueKey("btnLogin"),
                        width: double.infinity,
                        isLoading: model.state == ViewState.Busy,
                        onPressed: () {
                          model.signUp();
                        },
                      ),
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
