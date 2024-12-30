import 'package:mymanislier/app/utils/helpers/exporter.dart';

// TextTheme textTheme = Get.theme.textTheme;
// ColorScheme colorScheme = Get.theme.colorScheme;

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: const Color(0xff902368),
      onPrimary: const Color(0xffffffff),
      primaryContainer: Get.theme.customColors.bgOneColor,
      secondary: const Color(0xff0F3D4D),
      onSecondary: const Color(0xff04163C),
      secondaryContainer: Get.theme.customColors.greyTextColor,
      error: const Color(0xffFF7B7B),
      onError: const Color(0xffFF7B7B),
      surface: const Color(0xffF8F9FA),
      onSurface: const Color(0xff2E2F32),
      outline: Get.theme.customColors.primaryColor,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.light,
    ],
    dividerTheme:
        const DividerThemeData(color: Color(0xffF5F5F8), thickness: 1),
    scaffoldBackgroundColor: Get.theme.customColors.white,
    datePickerTheme: DatePickerThemeData(
      cancelButtonStyle: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
        TextStyle(
            fontFamily: 'Montserrat',
            color: Get.theme.customColors.primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w600),
      )),
      confirmButtonStyle: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
        TextStyle(
            fontFamily: 'Montserrat',
            color: Get.theme.customColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600),
      )),
      headerHelpStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0XFF252520),
          fontSize: 16,
          fontWeight: FontWeight.w500),
      headerHeadlineStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0XFF252520),
          fontSize: 24,
          fontWeight: FontWeight.w500),
      weekdayStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0XFF252520),
          fontSize: 16,
          fontWeight: FontWeight.w500),
      dayStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: Color(0XFF252520),
          fontSize: 16,
          fontWeight: FontWeight.w500),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: const Color(0xff902368).withOpacity(0.5),
        backgroundColor: Get.theme.customColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Get.theme.customColors.white; // Active thumb color
        }
        return Get.theme.customColors.red; // Inactive thumb color
      }),
      trackColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return Get.theme.customColors.greyTextColor?.withOpacity(0.5);
          }
          return Get.theme.customColors.red?.withOpacity(0.5);
        },
      ),
      thumbIcon: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Icon(
            Icons.done,
            color: Get.theme.customColors.primaryColor,
          );
        }
        return null;
      }),
    ),

    /// Whenever your use the AppBar make sure most of the scenario your AppBar theme is must be sat here.
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Get.theme.customColors.white,
      surfaceTintColor: Get.theme.customColors.transparent,
      titleTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Get.theme.customColors.black,
      ),
      iconTheme: IconThemeData(color: Get.theme.customColors.white),
    ),

    /// If you app supports a single FontFamily, So this is the best way to change FontFamily for allover the app.
    fontFamily: 'Montserrat',
    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      visualDensity: VisualDensity.compact,
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return Get.theme.customColors.primaryColor;
          }
          return Get.theme.customColors.greyBg;
        },
      ),
    ),

    /// InputDecorationTheme is used for make you TextFormField, DropDownFormField and many more widget.
    /// Those Widget Which is depended on InputDecorationTheme.
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Get.theme.customColors.textfieldFillColor,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xffFF7B7B)),
      ),
      contentPadding: const EdgeInsets.all(16),
      errorStyle: TextStyle(
        color: Get.theme.customColors.red,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      hintStyle: WidgetStateTextStyle.resolveWith(
        (states) {
          if (states.contains(WidgetState.error)) {
            return TextStyle(
              color: Get.theme.customColors.red,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            );
          }
          return TextStyle(
            color: Get.theme.customColors.greyTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          );
        },
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Get.theme.customColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dividerColor: Get.theme.customColors.bgOneColor,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Get.theme.customColors.primaryColor,
    ),
    textTheme: TextTheme(
      /// Headline styles: Used for larger text like AppBars and main titles
      headlineLarge: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 26,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 22,
          fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600),

      /// Title styles: Smaller than headline styles, medium emphasis for shorter text
      bodyLarge: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500),

      /// Label styles: Used for descriptions and small text with a more subtle appearance
      labelLarge: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.greyTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w400),
      labelMedium: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.greyTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      labelSmall: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.greyTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400),

      // You can add more text styles according to your design
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: const Color(0xff902368),
      onPrimary: const Color(0xffffffff),
      primaryContainer: Get.theme.customColors.bgOneColor,
      secondary: const Color(0xff0F3D4D),
      onSecondary: const Color(0xff04163C),
      secondaryContainer: Get.theme.customColors.greyTextColor,
      error: const Color(0xffFF7B7B),
      onError: const Color(0xffFF7B7B),
      surface: const Color(0xffF8F9FA),
      onSurface: const Color(0xff902368),
      outline: Get.theme.customColors.primaryColor,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.dark,
    ],
    scaffoldBackgroundColor: Get.theme.customColors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: const Color(0xff902368).withOpacity(0.5),
        backgroundColor: const Color(0xff902368),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Get.theme.customColors.white; // Active thumb color
        }
        return Get.theme.customColors.red; // Inactive thumb color
      }),
      trackColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return Get.theme.customColors.greyTextColor?.withOpacity(0.5);
          }
          return Get.theme.customColors.red?.withOpacity(0.5);
        },
      ),
      thumbIcon: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Icon(
            Icons.done,
            color: Get.theme.customColors.primaryColor,
          );
        }
        return null;
      }),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Get.theme.customColors.primaryColor,
      titleTextStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Get.theme.customColors.white,
      ),
      iconTheme: IconThemeData(color: Get.theme.customColors.black),
    ),
    fontFamily: 'Montserrat',
    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      visualDensity: VisualDensity.compact,
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return Get.theme.customColors.primaryColor;
          }
          return Get.theme.customColors.greyBg;
        },
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Get.theme.customColors.textfieldFillColor,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xffFF7B7B)),
      ),
      contentPadding: const EdgeInsets.all(16),
      errorStyle: TextStyle(
        color: Get.theme.customColors.red,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      hintStyle: WidgetStateTextStyle.resolveWith(
        (states) {
          if (states.contains(WidgetState.error)) {
            return TextStyle(
              color: Get.theme.customColors.red,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            );
          }
          return TextStyle(
            color: Get.theme.customColors.greyTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          );
        },
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Get.theme.customColors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dividerColor: Get.theme.customColors.bgOneColor,
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Get.theme.customColors.primaryColor,
    ),
    textTheme: TextTheme(
      /// Headline styles: Used for larger text like AppBars and main titles
      headlineLarge: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 26,
          fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 22,
          fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600),

      /// Title styles: Smaller than headline styles, medium emphasis for shorter text
      bodyLarge: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500),
      bodySmall: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500),

      /// Label styles: Used for descriptions and small text with a more subtle appearance
      labelLarge: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.greyTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w400),
      labelMedium: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.greyTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      labelSmall: TextStyle(
          fontFamily: 'Montserrat',
          color: Get.theme.customColors.greyTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400),

      // You can add more text styles according to your design

      /// Used for Headline Like AppBar And Other Titles which are largest in Ui.
      // headlineLarge: const TextStyle(color: Get.theme.customColors.white, fontSize: 26, fontWeight: FontWeight.w600),
      // headlineMedium: const TextStyle(color: Get.theme.customColors.white, fontSize: 22, fontWeight: FontWeight.w600),
      // headlineSmall: const TextStyle(color: Get.theme.customColors.white, fontSize: 20, fontWeight: FontWeight.w600),

      // ///  title styles:  are smaller than headline styles and should be used for shorter, medium-emphasis text.
      // // titleLarge: ,

      // /// Used For Most Used Styles
      // bodyLarge: const TextStyle(color: Get.theme.customColors.white, fontSize: 20, fontWeight: FontWeight.w500),
      // bodyMedium: const TextStyle(color: Get.theme.customColors.white, fontSize: 18, fontWeight: FontWeight.w500),
      // bodySmall: const TextStyle(color: Get.theme.customColors.white, fontSize: 16, fontWeight: FontWeight.w500),

      // ///USED for Description and Small Text.
      // labelLarge: TextStyle(color: Get.theme.customColors.bgOneColor, fontSize: 18, fontWeight: FontWeight.w400),
      // labelMedium: TextStyle(color: Get.theme.customColors.bgOneColor, fontSize: 16, fontWeight: FontWeight.w400),
      // labelSmall: TextStyle(color: Get.theme.customColors.bgOneColor, fontSize: 14, fontWeight: FontWeight.w400),

      //   Also U can add More TextStyle According Your Design
    ),
  );
}
