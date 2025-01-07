import 'dart:io';
import 'package:injectable/injectable.dart' as i;
import 'package:mymanislier/app/data/models/authModel/auth_model.dart';
import 'package:mymanislier/app/data/services/authService/auth_service.dart';
import 'package:mymanislier/app/utils/helpers/exporter.dart';

@i.lazySingleton
@i.injectable
class AuthController extends GetxController {
  AuthController() {
    onInit();
  }

  bool isDarkTheme = false;
  bool isDarkTheme1 = false;

  // Observable variables for user input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final signupUsernameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final signupConfirmPasswordController = TextEditingController();
  final signupconfirmPassfocusnode = FocusNode();

  final forgotEmailController = TextEditingController();

  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();
  final confirmPassfocusnode = FocusNode();

  final verificationCode = TextEditingController();
  final signupRerificationCode = TextEditingController();

  final RxBool userAgreementCheck = false.obs;

  final signinState = ApiState.initial().obs;
  final forgotState = ApiState.initial().obs;
  final resetPassState = ApiState.initial().obs;
  final registerState = ApiState.initial().obs;
  final verificationState = ApiState.initial().obs;

  final currentStep = 0.obs;
  final signupCurrentStep = 0.obs;
  final day = ''.obs;
  final month = ''.obs;
  final year = ''.obs;

  RxBool ispassword = true.obs;
  RxBool isConfirmpassword = true.obs;
  RxBool isAgree = true.obs;

  final tempSelectedImage = Rxn<File>();
  final selectedImage = Rxn<File>();

  // State variables for loading and model
  Rxn<AuthModel> authModel = Rxn<AuthModel>();

  // Helper method to display success messages
  void showSuccess(String message) {
    Get.snackbar('Success', message);
  }

  // Helper method to display error messages
  void showError(String message) {
    Get.snackbar('Error', message);
  }

  // Sign In method
  void signIn(FormState? formState) {
    if (formState == null || !formState.validate()) {
      return;
    }
    Get.offAllNamed(AppRoutes.welcomeHomeScreen);

    // Future.delayed(
    //   const Duration(seconds: 5),
    //   () => getIt<AuthService>().login(
    //     emailController.text,
    //     passwordController.text.convertMd5,
    //     deviceToken: '',
    //     deviceType: switch (Platform.operatingSystem) {
    //       'android' => 'Android',
    //       'ios' => 'iOS',
    //       _ => 'Other',
    //     },
    //   ),
    // ).handler(
    //   signinState,
    //   onSuccess: (value) {
    //     if (value != null) {
    //       authModel.value = value;
    //       showSuccess(authModel.value!.ResponseMsg);
    //       // Get.offNamed(AppRoutes.theme);
    //     }
    //   },
    //   onFailed: (value) {
    //     // If the onFailed is called that means your ApiState has FailedState value
    //     showError(value.error.description);
    //   },
    // );
  }

  // Sign Up method
  void signUp(FormState? formState) {
    if (formState == null || !formState.validate()) {
      return;
    }
    Get.toNamed(AppRoutes.signUpAuthenticationScreen);

    // Future.delayed(
    //   const Duration(seconds: 5),
    //   () => getIt<AuthService>().login(
    //     emailController.text,
    //     passwordController.text.convertMd5,
    //     deviceToken: '',
    //     deviceType: switch (Platform.operatingSystem) {
    //       'android' => 'Android',
    //       'ios' => 'iOS',
    //       _ => 'Other',
    //     },
    //   ),
    // ).handler(
    //   signinState,
    //   onSuccess: (value) {
    //     if (value != null) {
    //       authModel.value = value;
    //       showSuccess(authModel.value!.ResponseMsg);
    //       // Get.offNamed(AppRoutes.theme);
    //     }
    //   },
    //   onFailed: (value) {
    //     // If the onFailed is called that means your ApiState has FailedState value
    //     showError(value.error.description);
    //   },
    // );
  }

  void sendOtp(BuildContext context) {
    if (!Form.of(context).validate()) {
      return;
    }

    getIt<AuthService>()
        .sendOTP(
      signupEmailController.text,
      signupUsernameController.text,
    )
        .handler(
      registerState,
      onSuccess: (value) {
        if (value.data['ResponseCode'] == 1) {
          showSuccess(value.data['ResponseMsg'].toString());
          verificationCode.clear();
          // Get.toNamed(AppRoutes.verifyCode);
        } else {
          showError(AppStrings.T.registerFailed);
        }
      },
      onFailed: (value) {
        showError(AppStrings.T.registerFailed);
      },
    );
  }

  // Registration method
  void register(BuildContext context) {
    if (!Form.of(context).validate()) {
      return;
    }

    getIt<AuthService>()
        .register(
      email: signupEmailController.text,
      pass: signupPasswordController.text.convertMd5,
      phone: '',
      name: signupUsernameController.text,
      ccode: '+91',
      role: 'Student',
      otp: verificationCode.text,
    )
        .handler(
      registerState,
      onSuccess: (value) {
        if (value?.ResponseCode == 1) {
          authModel.value = value;
          showSuccess(AppStrings.T.registerSuccess);
          // Get.offAllNamed(AppRoutes.theme);
        } else {
          showError(value?.ResponseMsg ?? AppStrings.T.registerFailed);
        }
      },
      onFailed: (value) {
        showError(value.error.description);
      },
    );
  }

  // Forgot password method
  void forgotPassword(BuildContext context) {
    if (!Form.of(context).validate()) {
      return;
    }

    getIt<AuthService>().forgotPassword(forgotEmailController.text).handler(
      forgotState,
      onSuccess: (value) {
        if (value.data['ResponseCode'] == 1) {
          showSuccess(AppStrings.T.passwordResetEmailSent);
          verificationCode.clear();
          // Get.toNamed(AppRoutes.verifyCode);
        } else {
          showError(value.data['ResponseMsg'].toString());
        }
      },
      onFailed: (value) {
        showError(value.error.description);
      },
    );
  }

  // Reset password method with password match validation
  void resetPassword(BuildContext context) {
    if (!Form.of(context).validate()) {
      return;
    }
    getIt<AuthService>()
        .resetPassword(forgotEmailController.text,
            signupUsernameController.text.convertMd5)
        .handler(
      resetPassState,
      onSuccess: (value) {
        if (value.ResponseCode == 1) {
          showSuccess(AppStrings.T.passwordResetSuccess);
          // Get
          //   ..closeAllSnackbars()
          //   ..offAllNamed(AppRoutes.theme);
        } else {
          showError(value.ResponseMsg);
        }
      },
      onFailed: (value) {
        showError(value.error.description);
      },
    );
  }

  // Verify code method
  void verifyCode(BuildContext context) {
    if (!Form.of(context).validate()) return;
    // if (Get.previousRoute == AppRoutes.register) {
    //   return register(context);
    // }
    getIt<AuthService>()
        .verifyCode(forgotEmailController.text, verificationCode.text)
        .handler(
      verificationState,
      onSuccess: (value) {
        if (value.data['ResponseCode'] == 1) {
          showSuccess(AppStrings.T.codeVerificationSuccess);
          // Get.offNamed(AppRoutes.resetPassword);
        } else {
          showError(value.data['ResponseMsg'].toString());
        }
      },
      onFailed: (value) {
        showError(value.error.description);
      },
    );
  }

  @override
  @i.disposeMethod
  void dispose() {
    super.dispose();
    emailController.dispose();
    forgotEmailController.dispose();
    passwordController.dispose();
    signupUsernameController.dispose();
    verificationCode.dispose();
    signinState.close();
    forgotState.close();
    resetPassState.close();
    registerState.close();
    verificationState.close();
    authModel.close();
    // isDarkTheme.close();
  }
}
