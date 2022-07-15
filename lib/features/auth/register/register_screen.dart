import 'dart:convert';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smart_city_hack/constants/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fio = ''.obs;
  final _email = ''.obs;
  final _password = ''.obs;

  Widget _customTextFormInput(
    String hint,
    Function(String) callback, [
    bool isPassword = false,
  ]) {
    return Container(
      constraints: const BoxConstraints(minHeight: 50),
      child: TextFormField(
        style: GoogleFonts.jost(
          decoration: TextDecoration.none,
          color: AppConstants.colors.purple,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        obscureText: isPassword,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          hintText: hint,
        ),
        onChanged: (String? s) {
          if (s != null) callback(s);
        },
        validator: (String? s) {
          if (s == null || s.isEmpty) {
            return 'Поле не может быть пустым';
          }
          return null;
        },
      ),
    );
  }

  Widget _registerButton(Function() callback) {
    return Container(
      width: 280,
      height: 50,
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppConstants.colors.darkBlue,
            AppConstants.colors.pink,
          ],
        ),
      ),
      child: MaterialButton(
        shape: const StadiumBorder(),
        child: const Text(
          'Зарегистрироваться',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: callback,
      ),
    );
  }

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
              'Регистрация',
              style: GoogleFonts.jost(
                decoration: TextDecoration.none,
                color: AppConstants.colors.purple,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Заполни свой Дневник',
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
                    _customTextFormInput('Фамилия и имя', (s) {
                      _fio.value = s;
                    }),
                    const SizedBox(height: 10),
                    _customTextFormInput('Почта', (s) {
                      _email.value = s;
                    }),
                    const SizedBox(height: 10),
                    _customTextFormInput(
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
            _registerButton(() {
              if (_formKey.currentState!.validate()) {
                var url = 'http://45.141.103.37:10000/register';

                return http
                    .post(
                      Uri.parse(url),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(<String, String>{
                        'username': _fio.value,
                        'email': _email.value,
                        'password': _password.value,
                      }),
                    )
                    .then((value) => log('${value.statusCode}'));
              }
            }),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'У тебя уже есть аккаунт? ',
                    style: TextStyle(
                      color: AppConstants.colors.darkBlue,
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  TextSpan(
                    text: 'Войти',
                    style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.toNamed(AppConstants.routes.login),
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
