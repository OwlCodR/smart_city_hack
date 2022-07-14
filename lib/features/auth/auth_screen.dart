import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_city_hack/constants/constants.dart';
import 'package:smart_city_hack/features/auth/register/register_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  Widget _titleWidget() {
    return Container(
      constraints: const BoxConstraints(minWidth: 100, maxWidth: 320),
      child: Column(
        children: [
          Text.rich(
            const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Привет, Мечтатель!\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: 'Добро пожаловать в «Дневник мечты» здесь ты найдешь '
                      'ответы на важные вопросы, лучше узнаешь себя и поймешь, '
                      'что для тебя по-настоящему важно.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
            style: GoogleFonts.jost(decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }

  Widget _nextButton() {
    return SizedBox(
      width: 280,
      height: 60,
      child: TextButton(
        onPressed: () {
          Get.to(const RegisterScreen());
        },
        child: Text(
          'Вперед к мечте!',
          style: GoogleFonts.jost(
            decoration: TextDecoration.none,
            color: AppConstants.colors.purple,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: TextButton.styleFrom(
          foregroundColor: Colors.teal,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppConstants.gradients.background,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            'assets/images/rocket.png',
            height: 360,
          ),
          Column(
            children: [
              const SizedBox(height: 30),
              _titleWidget(),
              const Spacer(),
              _nextButton(),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/subtitle_logo.png',
                width: 200,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
