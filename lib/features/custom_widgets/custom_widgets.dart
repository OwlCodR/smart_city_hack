import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_city_hack/constants/constants.dart';

Widget customTextFormInput(
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

Widget gradientButton(String text, Function() callback) {
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
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: callback,
    ),
  );
}
