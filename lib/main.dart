import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_city_hack/features/auth/auth_screen.dart';

import 'constants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppConstants.routes.auth,
      getPages: [
        GetPage(
          name: AppConstants.routes.auth,
          page: () => const AuthScreen(),
        ),
        // GetPage(
        //   name: AppConstants.routes.main,
        //   page: () => MainScreen(),
        // ),
      ],
    );
  }
}
