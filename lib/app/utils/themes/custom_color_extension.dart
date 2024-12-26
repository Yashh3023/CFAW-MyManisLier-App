import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.bgColor,
    required this.greyTextColor,
    required this.greyBg,
    required this.textfieldFillColor,
    required this.transparent,
    required this.red,
    required this.black,
    required this.white,
    required this.blackColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.bgOneColor,
    required this.bgTwoColor,
    required this.chatbgcolor,
  });

  final Color? bgColor;
  final Color? greyTextColor;
  final Color? greyBg;
  final Color? textfieldFillColor;
  final Color? transparent;
  final Color? red;
  final Color? black;
  final Color? white;
  final Color? blackColor;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? bgOneColor;
  final Color? bgTwoColor;
  final Color? chatbgcolor;

  // Default light theme colors
  static const light = CustomColors(
    primaryColor: Color(0xff902368),
    bgColor: Color(0xff000000),
    greyBg: Color(0XFF0E0F11),
    secondaryColor: Color(0xffC791B0),
    greyTextColor: Color(0xFF7A7C7E),
    textfieldFillColor: Color(0xFF0E0F11),
    transparent: Colors.transparent,
    red: Color(0xffFF7B7B),
    black: Color(0xff04163C),
    white: Colors.white,
    blackColor: Colors.black,
    bgOneColor: Color(0xffE8EAEB),
    bgTwoColor: Color(0xffF8F9FA),
    chatbgcolor: Color(0xffF8F6FD),
  );

  // Default dark theme colors
  static const dark = CustomColors(
    primaryColor: Color(0xff902368),
    bgColor: Color(0xff000000),
    greyBg: Color(0XFF0E0F11),
    secondaryColor: Color(0xffC791B0),
    greyTextColor: Color(0xFF7E808C),
    textfieldFillColor: Color(0xFF0E0F11),
    transparent: Colors.transparent,
    red: Color(0xffFF7B7B),
    black: Color(0xff04163C),
    white: Colors.white,
    blackColor: Colors.black,
    bgOneColor: Color(0xffE8EAEB),
    bgTwoColor: Color(0xffF8F9FA),
    chatbgcolor: Color(0xffF8F6FD),
  );

  @override
  CustomColors copyWith({
    Color? greyTextColor,
    Color? bgColor,
    Color? greyBg,
    Color? textfieldFillColor,
    Color? transparent,
    Color? red,
    Color? black,
    Color? white,
    Color? blackColor,
    Color? primaryColor,
    Color? secondaryColor,
    Color? bgOneColor,
    Color? bgTwoColor,
    Color? chatbgcolor,
  }) {
    return CustomColors(
      greyTextColor: greyTextColor ?? this.greyTextColor,
      bgColor: bgColor ?? this.bgColor,
      greyBg: greyBg ?? this.greyBg,
      textfieldFillColor: textfieldFillColor ?? this.textfieldFillColor,
      transparent: transparent ?? this.transparent,
      red: red ?? this.red,
      black: black ?? this.black,
      white: white ?? this.white,
      blackColor: blackColor ?? this.blackColor,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      bgOneColor: bgOneColor ?? this.bgOneColor,
      bgTwoColor: bgTwoColor ?? this.bgTwoColor,
      chatbgcolor: chatbgcolor ?? this.chatbgcolor,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      bgColor: Color.lerp(bgColor, other.bgColor, t),
      greyBg: Color.lerp(greyBg, other.greyBg, t),
      greyTextColor: Color.lerp(greyTextColor, other.greyTextColor, t),
      textfieldFillColor:
          Color.lerp(textfieldFillColor, other.textfieldFillColor, t),
      transparent: Color.lerp(transparent, other.transparent, t),
      red: Color.lerp(red, other.red, t),
      black: Color.lerp(black, other.black, t),
      white: Color.lerp(white, other.white, t),
      blackColor: Color.lerp(blackColor, other.blackColor, t),
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
      bgOneColor: Color.lerp(bgOneColor, other.bgOneColor, t),
      bgTwoColor: Color.lerp(bgTwoColor, other.bgTwoColor, t),
      chatbgcolor: Color.lerp(chatbgcolor, other.chatbgcolor, t),
    );
  }
}

extension ThemeDataCustomColors on ThemeData {
  CustomColors get customColors {
    final customColors = extension<CustomColors>();
    if (customColors == null) {
      return CustomColors.light;
    }
    return customColors;
  }
}
