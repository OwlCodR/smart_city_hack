import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_city_hack/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 33,
            ),
            const Spacer(),
            Center(
              child: Text(
                'Профиль',
                style: GoogleFonts.jost(
                  decoration: TextDecoration.none,
                  color: AppConstants.colors.purple,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Get.toNamed(AppConstants.routes.profile),
              child: Image.asset(
                'assets/images/avatar.png',
                width: 40,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/user_info.png',
              height: 140,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/user_rewards.png',
              height: 110,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/user_progress.png',
              height: 100,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/user_settings.png',
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
