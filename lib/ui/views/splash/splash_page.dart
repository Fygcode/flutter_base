import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_node/core/enum/view_state.dart';
import 'package:stacked_node/ui/views/splash/splash_provider.dart';

import '../../../core/model/user_model.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<SplashProvider>(
          builder: (context, splashProvider, child) {
            if (splashProvider.state == ViewState.Busy) {
              return const CircularProgressIndicator();
            } else {
              // API call has completed, display the data
              return Icon(Icons.ac_unit);
              // return ListView.builder(
              //   itemCount: splashProvider.userModel.length,
              //   itemBuilder: (context, index) {
              //     UserModel data = splashProvider.userModel[index];
              //     return Text(data.name);
              //   },
              // );
            }
          },
        ),
      ),
    );
  }
}


// return ChangeNotifierProvider<SplashViewModel>(
// create: (context) => SplashViewModel()..init(),
// child: Consumer<SplashViewModel>(
// builder: (context, model, child) {
// return Scaffold(
// body: Center(child: CircularProgressIndicator()),
// );
// },
// ),
// );