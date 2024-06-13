import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked_node/locator.dart';

import '../../../router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Muthuraj"),
      ),
      body: Column(
        children: [
          const Text("Home Screen Here"),
          ElevatedButton(
            child: const Text('Press me!'),
            onPressed: () {
              navigationService.pushNamed(Routes.signUp);
            },
          ),
        ],
      ),
    );
  }
}
