import 'package:mymanislier/app/routes/app_routes.dart';
import 'package:mymanislier/app/ui/pages/authentication/get_started_screen.dart';
import 'package:mymanislier/app/ui/pages/authentication/signin_screen.dart';
import 'package:mymanislier/app/ui/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    // Get Satred Screen
    GetPage(
      name: AppRoutes.getStarted,
      page: GetStartedScreen.new,
    ),
    // Sign In Screen
    GetPage(
      name: AppRoutes.sigin,
      page: SignInScreen.new,
    ),
   
  ];
}
