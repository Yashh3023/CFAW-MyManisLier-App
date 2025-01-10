import 'package:mymanislier/app/utils/helpers/exporter.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.bgColor,
    required this.greyTextColor,
    required this.greyBg,
    required this.textfieldFillColor,
    required this.appBarIcBg,
    required this.transparent,
    required this.red,
    required this.black,
    required this.white,
    required this.darkGrey,
    required this.primaryColor,
    required this.secondaryColor,
    required this.darkGreyBorder,
    required this.bgOneColor,
    required this.bgTwoColor,
    required this.chatbgcolor,
    required this.blueText,
    required this.greyBorder,
    required this.greyContainerBg,
    required this.green,
    required this.orange,
    required this.yellow,
    required this.blue,
    required this.grey,
    required this.pastetext,
    required this.secondarybtn,
  });

  final Color? bgColor;
  final Color? greyTextColor;
  final Color? greyBg;
  final Color? textfieldFillColor;
  final Color? appBarIcBg;
  final Color? transparent;
  final Color? red;
  final Color? black;
  final Color? white;
  final Color? darkGrey;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? darkGreyBorder;
  final Color? bgOneColor;
  final Color? bgTwoColor;
  final Color? chatbgcolor;
  final Color? blueText;
  final Color? greyBorder;
  final Color? greyContainerBg;
  final Color? green;
  final Color? orange;
  final Color? yellow;
  final Color? blue;
  final Color? grey;
  final Color? pastetext;
  final Color? secondarybtn;

  // Default light theme colors
  static const light = CustomColors(
      primaryColor: Color(0xff902368),
      secondaryColor: Color(0xffC791B0),
      bgColor: Color(0xff14151A),
      greyBg: Color(0XFF0E0F11),
      greyContainerBg: Color(0XFF17181B),
      darkGreyBorder: Color(0xff1C1C1C),
      greyTextColor: Color(0xFF7A7C7E),
      textfieldFillColor: Color(0xFF0E0F11),
      appBarIcBg: Color(0xff9A3073),
      transparent: Colors.transparent,
      red: Color(0xffFF2929),
      black: Color(0xff000000),
      white: Colors.white,
      darkGrey: Color(0xffC7C7C7),
      bgOneColor: Color(0xffE8EAEB),
      bgTwoColor: Color(0xffF8F9FA),
      chatbgcolor: Color(0xffF8F6FD),
      blueText: Color(0xff0570DE),
      greyBorder: Color(0xffE0E2F1),
      green: Color(0xff42A942),
      orange: Color(0xffDA2E2E),
      yellow: Color(0xffFFB700),
      blue: Color(0xff0570DE),
      grey: Color(0xff7D7E80),
      pastetext: Color(0XFF2D2E30),
      secondarybtn: Color(0xff202020));

  // Default dark theme colors
  static const dark = CustomColors(
      primaryColor: Color(0xff902368),
      secondaryColor: Color(0xffC791B0),
      bgColor: Color(0xff000000),
      greyBg: Color(0XFF0E0F11),
      greyContainerBg: Color(0XFF17181B),
      darkGreyBorder: Color(0xff1C1C1C),
      greyTextColor: Color(0xFF7A7C7E),
      textfieldFillColor: Color(0xFF0E0F11),
      appBarIcBg: Color(0xff9A3073),
      transparent: Colors.transparent,
      red: Color(0xffFF2929),
      black: Color(0xff000000),
      white: Colors.white,
      darkGrey: Colors.black,
      bgOneColor: Color(0xffE8EAEB),
      bgTwoColor: Color(0xffF8F9FA),
      chatbgcolor: Color(0xffF8F6FD),
      blueText: Color(0xff0570DE),
      greyBorder: Color(0xffE0E2F1),
      green: Color(0xff42A942),
      orange: Color(0xffDA2E2E),
      yellow: Color(0xffFFB700),
      blue: Color(0xff0570DE),
      grey: Color(0xff7D7E80),
      pastetext: Color(0XFF2D2E30),
      secondarybtn: Color(0xff202020));

  @override
  CustomColors copyWith({
    Color? greyTextColor,
    Color? bgColor,
    Color? greyBg,
    Color? greyContainerBg,
    Color? textfieldFillColor,
    Color? appBarIcBg,
    Color? transparent,
    Color? red,
    Color? black,
    Color? white,
    Color? darkGrey,
    Color? primaryColor,
    Color? secondaryColor,
    Color? darkGreyBorder,
    Color? bgOneColor,
    Color? bgTwoColor,
    Color? chatbgcolor,
    Color? blueText,
    Color? greyBorder,
    Color? green,
    Color? orange,
    Color? yellow,
    Color? blue,
    Color? grey,
    Color? pastetext,
    Color? secondarybtn,
  }) {
    return CustomColors(
      greyTextColor: greyTextColor ?? this.greyTextColor,
      bgColor: bgColor ?? this.bgColor,
      greyBg: greyBg ?? this.greyBg,
      textfieldFillColor: textfieldFillColor ?? this.textfieldFillColor,
      appBarIcBg: appBarIcBg ?? this.appBarIcBg,
      transparent: transparent ?? this.transparent,
      red: red ?? this.red,
      black: black ?? this.black,
      white: white ?? this.white,
      darkGrey: darkGrey ?? this.darkGrey,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      darkGreyBorder: darkGreyBorder ?? this.darkGreyBorder,
      bgOneColor: bgOneColor ?? this.bgOneColor,
      bgTwoColor: bgTwoColor ?? this.bgTwoColor,
      chatbgcolor: chatbgcolor ?? this.chatbgcolor,
      blueText: blueText ?? this.blueText,
      greyBorder: greyBorder ?? this.greyBorder,
      greyContainerBg: greyContainerBg ?? this.greyContainerBg,
      green: green ?? this.green,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      blue: blue ?? this.blue,
      grey: grey ?? this.grey,
      pastetext: pastetext ?? this.pastetext,
      secondarybtn: secondarybtn ?? this.secondarybtn,
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
        appBarIcBg: Color.lerp(appBarIcBg, other.appBarIcBg, t),
        transparent: Color.lerp(transparent, other.transparent, t),
        red: Color.lerp(red, other.red, t),
        black: Color.lerp(black, other.black, t),
        white: Color.lerp(white, other.white, t),
        darkGrey: Color.lerp(darkGrey, other.darkGrey, t),
        primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
        secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t),
        darkGreyBorder: Color.lerp(darkGreyBorder, other.darkGreyBorder, t),
        bgOneColor: Color.lerp(bgOneColor, other.bgOneColor, t),
        bgTwoColor: Color.lerp(bgTwoColor, other.bgTwoColor, t),
        chatbgcolor: Color.lerp(chatbgcolor, other.chatbgcolor, t),
        blueText: Color.lerp(blueText, other.blueText, t),
        greyBorder: Color.lerp(greyBorder, other.greyBorder, t),
        greyContainerBg: Color.lerp(greyContainerBg, other.greyContainerBg, t),
        green: Color.lerp(green, other.green, t),
        orange: Color.lerp(orange, other.orange, t),
        yellow: Color.lerp(yellow, other.yellow, t),
        blue: Color.lerp(blue, other.blue, t),
        grey: Color.lerp(grey, other.grey, t),
        pastetext: Color.lerp(pastetext, other.pastetext, t),
        secondarybtn: Color.lerp(secondarybtn, other.secondarybtn, t));
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
