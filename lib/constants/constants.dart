import 'dart:ui';

class AppConstants {
  static _AppGradients gradients = _AppGradients();
  static _AppColors colors = _AppColors();
  static _AppRoutes routes = _AppRoutes();
  static _AppPaths paths = _AppPaths();
  static _AppKeys keys = _AppKeys();
}

class _AppGradients {
  final background = [
    AppConstants.colors.darkBlue,
    AppConstants.colors.blue,
    AppConstants.colors.pink,
  ];
}

class _AppColors {
  final darkBlue = const Color(0xFF0E053A);
  final blue = const Color(0xFF381F61);
  final pink = const Color(0xFFBA74A0);
  final purple = const Color(0xFF41008B);
}

class _AppRoutes {
  final auth = '/auth';
  final register = '/register';
  final login = '/login';
}

class _AppKeys {
  final isLogined = 'IS_LOGINED';
}

class _AppPaths {}
