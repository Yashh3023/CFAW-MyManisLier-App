import 'package:mymanislier/app/routes/app_routes.dart';
import 'package:mymanislier/app/ui/pages/authentication/authentication_screen.dart';
import 'package:mymanislier/app/ui/pages/authentication/forgot_password_screen.dart';
import 'package:mymanislier/app/ui/pages/authentication/get_started_screen.dart';
import 'package:mymanislier/app/ui/pages/authentication/signup_authentication_screen.dart';
import 'package:mymanislier/app/ui/pages/authentication/reset_password_screen.dart';
import 'package:mymanislier/app/ui/pages/authentication/sign_up_screen.dart';
import 'package:mymanislier/app/ui/pages/authentication/sign_in_screen.dart';
import 'package:mymanislier/app/ui/pages/home/analysis_screen.dart';
import 'package:mymanislier/app/ui/pages/home/chat_based_questions_screen.dart';
import 'package:mymanislier/app/ui/pages/home/generic_questions_screen.dart';
import 'package:mymanislier/app/ui/pages/home/unlock_analysis_screen.dart';
import 'package:mymanislier/app/ui/pages/home/welcome_home_screen.dart';
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
    // Sign Up Screen
    GetPage(
      name: AppRoutes.signup,
      page: SignUpScreen.new,
    ),
    // Forgot Password Screen
    GetPage(
      name: AppRoutes.forgotPasswordScreen,
      page: ForgotPasswordScreen.new,
    ),
    // Authentication Screen
    GetPage(
      name: AppRoutes.authenticationScreen,
      page: AuthenticationScreen.new,
    ),
    // Reset Password Screen
    GetPage(
      name: AppRoutes.resetPasswordScreen,
      page: ResetPasswordScreen.new,
    ),
    // SignUp Authentication Screen
    GetPage(
      name: AppRoutes.signUpAuthenticationScreen,
      page: SignUpAuthenticationScreen.new,
    ),
    // Welcome Home Screen
    GetPage(
      name: AppRoutes.welcomeHomeScreen,
      page: WelcomeHomeScreen.new,
    ),
    // Generic Questions Screen
    GetPage(
      name: AppRoutes.genericQuestionsScreen,
      page: GenericQuestionsScreen.new,
    ),
    // Unlock Analysis Screen
    GetPage(
      name: AppRoutes.unlockAnalysisScreen,
      page: UnlockAnalysisScreen.new,
    ),
    // Chat Based Questions Screen
    GetPage(
      name: AppRoutes.chatBasedQuestionsScreen,
      page: ChatBasedQuestionsScreen.new,
    ),
    // Analysis Screen
    GetPage(
      name: AppRoutes.analysisScreen,
      page: AnalysisScreen.new,
    ),
  ];
}
