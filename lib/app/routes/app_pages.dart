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
import 'package:mymanislier/app/ui/pages/setting/about_us_screen.dart';
import 'package:mymanislier/app/ui/pages/setting/change_password_screen.dart';
import 'package:mymanislier/app/ui/pages/setting/contact_us_screen.dart';
import 'package:mymanislier/app/ui/pages/setting/delete_account_screen.dart';
import 'package:mymanislier/app/ui/pages/setting/edit_profile_screen.dart';
import 'package:mymanislier/app/ui/pages/setting/faq_screen.dart';
import 'package:mymanislier/app/ui/pages/setting/my_profile_screen.dart';
import 'package:mymanislier/app/ui/pages/setting/privacy_policy_screen.dart';
import 'package:mymanislier/app/ui/pages/setting/setting_screen.dart';
import 'package:mymanislier/app/ui/pages/setting/terms_and_conditions_screen.dart';
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
    // Setting Screen
    GetPage(
      name: AppRoutes.settingScreen,
      page: SettingScreen.new,
    ),
    // My Profile Screen
    GetPage(
      name: AppRoutes.myProfileScreen,
      page: MyProfileScreen.new,
    ),
    // Edit Profile Screen
    GetPage(
      name: AppRoutes.editProfileScreen,
      page: EditProfileScreen.new,
    ),
    //Change Password Screen
    GetPage(
      name: AppRoutes.changePasswordScreen,
      page: ChangePasswordScreen.new,
    ),
    //Faq Screen
    GetPage(
      name: AppRoutes.faqScreen,
      page: FaqScreen.new,
    ),
    //About Us Screen
    GetPage(
      name: AppRoutes.aboutUsScreen,
      page: AboutUsScreen.new,
    ),
    //Contact Us Screen
    GetPage(
      name: AppRoutes.contactUsScreen,
      page: ContactUsScreen.new,
    ),
    //Privacy Policy Screen
    GetPage(
      name: AppRoutes.privacyPolicyScreen,
      page: PrivacyPolicyScreen.new,
    ),
    //Terms N Conditions Screen
    GetPage(
      name: AppRoutes.termsNConditionsScreen,
      page: TermsNConditionsScreen.new,
    ),
    //Delete Account Screen
    GetPage(
      name: AppRoutes.deleteAccountScreen,
      page: DeleteAccountScreen.new,
    ),
  ];
}
