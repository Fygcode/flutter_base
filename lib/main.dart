import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_node/router.dart';
import 'package:stacked_node/ui/views/splash/splash_provider.dart';

import 'core/res/styles.dart';
import 'locator.dart';
// Future<void> main() async {
//
//   setupLocator();
//   WidgetsFlutterBinding.ensureInitialized();
// //  await Firebase.initializeApp();
//
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//    MyApp({super.key});
//
//   final navigationService = locator<NavigationService>();
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // return MultiProvider(
//     //   providers: [
//     //     Provider<AppConfig>(create: (context) => locator<AppConfigService>().config),
//     //     ChangeNotifierProvider(create: (_) => SplashProvider()),
//     //  ],
//     //   child: MaterialApp(
//     //     title: "MMM",
//     //     theme: AppStyle.appTheme,
//     //   //  builder: _setupDialogManager,
//     //  //   initialRoute: '/',
//     //     debugShowCheckedModeBanner: false,
//     //     navigatorKey: navigationService.navigatorKey,
//     //     onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
//     //     home: HomePage(),
//     //   ),
//     // );
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/' ,
//       onGenerateRoute: (settings) => AppRouter.generateRoute(settings),
//     );
//   }
// }


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return SplashProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        onGenerateRoute: (setting) => AppRouter.generateRoute(setting),
        navigatorKey: navigationService.navigatorKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}


