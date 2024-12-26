import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:mymanislier/app/controllers/app_controller.dart';
import 'package:mymanislier/app/routes/app_pages.dart';
import 'package:mymanislier/app/routes/app_routes.dart';
import 'package:mymanislier/app/utils/helpers/extensions/extensions.dart';
import 'package:mymanislier/app/utils/helpers/injectable/injectable.dart';
import 'package:mymanislier/app/utils/themes/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  configuration(
    myApp: const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    FlutterNativeSplash.remove();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyManIsLier',
        getPages: AppPages.routes,
        initialRoute: AppRoutes.splash,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(getIt<SharedPreferences>().getAppLocal ?? 'en'),
        ///Default Theme
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        builder: EasyLoading.init(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
