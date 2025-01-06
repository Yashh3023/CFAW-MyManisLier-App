import 'dart:ui';

import 'package:mymanislier/app/utils/helpers/exporter.dart';

class SignUpAuthenticationScreen extends GetItHook<AuthController> {
  SignUpAuthenticationScreen({super.key});

  final passObscure = true.obs;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Get.theme.customColors.black,
        appBar: _buildAppBar(),
        body: _buildBody(context),
        bottomNavigationBar: _buildresendCodeRedirect(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppbar(
      appbarBgColor: Get.theme.customColors.black,
      onLeadingTap: Get.back,
    );
  }

  Widget _buildBody(BuildContext context) {
    final signUpAuthFormKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom / 4),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
        child: Column(
          children: [
            _buildHeader(),
            Gap(28.h),
            _buildImageSection(),
            Gap(28.h),
            _buildOtpTextField(),
            Gap(28.h),
            _buildCodeSentMessage(),
            Gap(28.h),
            _buildButtons(signUpAuthFormKey),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        CenterText(
          AppStrings.T.lbl_authentication,
          style: Get.theme.textTheme.headlineLarge!
              .copyWith(color: Get.theme.customColors.white),
        ),
        Gap(10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: CenterText(
            AppStrings.T.lbl_authentication_subtitle,
            style: Get.theme.textTheme.labelMedium!.copyWith(
              color: Get.theme.customColors.grey,
              letterSpacing: 0.1,
              fontSize: 16.0.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return CustomImageView(
      imagePath: AssetConstants.pngAuthCircle,
      height: 200,
    );
  }

  Widget _buildOtpTextField() {
    return Center(
      child: Pinput(
        controller: controller.signupRerificationCode,
        pinAnimationType: PinAnimationType.slide,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        validator: AppValidations.verificationCodeValidation,
        focusedPinTheme: _buildPinTheme(border: Get.theme.primaryColor),
        defaultPinTheme: _buildPinTheme(),
        errorPinTheme: _buildPinTheme(border: Get.theme.colorScheme.error),
      ),
    );
  }

  PinTheme _buildPinTheme({Color? border}) {
    return PinTheme(
      height: 56.h,
      width: 71.w,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      textStyle: Get.textTheme.bodyMedium?.copyWith(
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: Get.theme.customColors.greyTextColor),
      decoration: BoxDecoration(
        color: Get.theme.customColors.textfieldFillColor,
        borderRadius: BorderRadius.circular(80.r),
        border: border != null ? Border.all(color: border, width: 2.w) : null,
      ),
    );
  }

  Widget _buildCodeSentMessage() {
    return Column(
      children: [
        CenterText(
          AppStrings.T.lbl_code_was_sent,
          style: Get.theme.textTheme.labelMedium!.copyWith(
            color: Get.theme.customColors.grey,
            letterSpacing: 0.1,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CenterText(
            controller.signupEmailController.text,
            style: Get.theme.textTheme.labelMedium!.copyWith(
              color: Get.theme.customColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons(
    GlobalKey<FormState> signUpAuthFormKey,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomElevatedButton(
        text: AppStrings.T.lbl_verify_code,
        onPressed: () {
          if (signUpAuthFormKey.currentState?.validate() ?? false) {
            Get.focusScope!.unfocus();
            controller.signupCurrentStep.value = 3;
          }
          if (_formKey.currentState?.validate() ?? false) {
            Get.focusScope!.unfocus();
            _showAlertSuccessfulDialog(Get.context!);
          }
        },
      ),
    );
  }

  Widget _buildresendCodeRedirect() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: AppRichText(
        spans: [
          AppSpan(
            text: AppStrings.T.lbl_resend_code,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.focusScope!.unfocus();
                Get.offAllNamed(AppRoutes.signup);
              },
            style: Get.textTheme.bodySmall?.copyWith(
                color: Get.theme.customColors.secondaryColor,
                decorationColor: Get.theme.customColors.secondaryColor,
                decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  void _showAlertSuccessfulDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Center(
              child: AlertDialog(
                backgroundColor: Get.theme.customColors.greyBg,
                title: Column(
                  children: [
                    CustomImageView(
                      imagePath: AssetConstants.svgCongratulation,
                    ),
                    Gap(20.h),
                    CenterText(
                      AppStrings.T.lbl_congratulations,
                      style: Get.theme.textTheme.headlineLarge!
                          .copyWith(color: Get.theme.customColors.white),
                    ),
                    Gap(14.h),
                    CenterText(
                      AppStrings.T.lbl_account_created_successfully,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                          color: Get.theme.customColors.greyTextColor),
                    ),
                    Gap(30.h),
                    CustomElevatedButton(
                      text: AppStrings.T.lbl_ok,
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.welcomeHomeScreen);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  bool get canDisposeController => true;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}
