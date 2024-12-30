import 'package:mymanislier/app/utils/helpers/exporter.dart';

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
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MyManIsLier',
          getPages: AppPages.routes,
          initialRoute: AppRoutes.splash,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(getIt<SharedPreferences>().getAppLocal ?? 'en'),
          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          builder: EasyLoading.init(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
