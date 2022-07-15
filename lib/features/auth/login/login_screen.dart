import 'dart:convert';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smart_city_hack/constants/constants.dart';
import 'package:smart_city_hack/features/custom_widgets/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _email = ''.obs;
  final _password = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 100,
            ),
            Text(
              'Вход',
              style: GoogleFonts.jost(
                decoration: TextDecoration.none,
                color: AppConstants.colors.purple,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Введи свой логин и пароль',
              style: GoogleFonts.jost(
                decoration: TextDecoration.none,
                color: AppConstants.colors.darkBlue,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              constraints: const BoxConstraints(maxWidth: 280),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    customTextFormInput('Почта', (s) {
                      _email.value = s;
                    }),
                    const SizedBox(height: 10),
                    customTextFormInput(
                      'Пароль',
                      (s) {
                        _password.value = s;
                      },
                      true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            gradientButton('Войти', () {
              if (_formKey.currentState!.validate()) {
                var url = 'http://45.141.103.37:10000/login';

                return http
                    .post(
                  Uri.parse(url),
                  headers: <String, String>{
                    'Content-Type': 'application/json; charset=UTF-8',
                  },
                  body: jsonEncode(<String, String>{
                    'email': _email.value,
                    'password': _password.value,
                  }),
                )
                    .then((value) {
                  log('${value.statusCode}');
                  if (value.statusCode != 200) {
                    Get.showSnackbar(
                      const GetSnackBar(
                        title: 'Ошибка!',
                        message: 'Проверьте корректность введенных данных.',
                        isDismissible: true,
                      ),
                    );
                  } else {
                    // @TODO Save token locally
                  }
                });
              }
            }),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'У тебя еще нет аккаунта? ',
                    style: TextStyle(
                      color: AppConstants.colors.darkBlue,
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  TextSpan(
                    text: 'Создать',
                    style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.toNamed(AppConstants.routes.register),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              style: GoogleFonts.jost(decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
