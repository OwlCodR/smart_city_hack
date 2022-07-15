import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:smart_city_hack/features/auth/auth_screen.dart';
import 'package:smart_city_hack/features/auth/login/login_screen.dart';
import 'package:smart_city_hack/features/auth/register/register_screen.dart';

import 'constants/constants.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _checkToken(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            bool isToken = snapshot.data != null && snapshot.data == true;

            log('isToken = $isToken');

            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              initialRoute:
                  isToken ? AppConstants.routes.main : AppConstants.routes.auth,
              getPages: [
                GetPage(
                  name: AppConstants.routes.auth,
                  page: () => const AuthScreen(),
                ),
                GetPage(
                  name: AppConstants.routes.register,
                  page: () => const RegisterScreen(),
                ),
                GetPage(
                  name: AppConstants.routes.login,
                  page: () => const LoginScreen(),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            log('${snapshot.error}');
            Get.showSnackbar(
              const GetSnackBar(
                title: 'Ошибка!',
                message: 'Проверьте подключение к сети.',
                isDismissible: true,
              ),
            );
            return Container();
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Future<bool> _checkToken() async {
    GetStorage box = GetStorage();

    if (!box.hasData(AppConstants.keys.token)) return false;

    var url = 'http://45.141.103.37:10000/checktoken';
    var token = box.read(AppConstants.keys.token);

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'token': token,
      }),
    );

    log(response.body);
    log('${response.statusCode}');
    return response.body == 'true';
  }
}
