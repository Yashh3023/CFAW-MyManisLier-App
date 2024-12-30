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
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 8.0.h),
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
        Gap(5.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: CenterText(
            AppStrings.T.lbl_authentication_subtitle,
            style: Get.theme.textTheme.labelMedium!
                .copyWith(color: Get.theme.customColors.greyTextColor),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return CustomImageView(
      imagePath: AssetConstants.svgAuthCircle,
    );
  }

  Widget _buildOtpTextField() {
    return Center(
      child: Pinput(
        controller: controller.signupRerificationCode,
        pinAnimationType: PinAnimationType.slide,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        preFilledWidget: Text(
          '-',
          style: Get.theme.textTheme.bodyLarge!
              .copyWith(color: Get.theme.customColors.white),
        ),
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
          fontWeight: FontWeight.w800,
          color: Get.theme.customColors.white),
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
          style: Get.theme.textTheme.labelMedium!
              .copyWith(color: Get.theme.customColors.greyTextColor),
        ),
        Gap(8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CenterText(
            'johndory007@gmail.com',
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
          // Get.toNamed(AppRoutes.resetPasswordScreen);
          if (_formKey.currentState?.validate() ?? false) {
            Get.focusScope!.unfocus();
            _showAlertSuccessfulDialog(Get.context!);
          } else {
            Get.snackbar(
              'Validation Error',
              'Please enter the OTP before proceeding.',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Get.theme.customColors.red?.withOpacity(0.5),
              colorText: Get.theme.customColors.white,
            );
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
            text: AppStrings.T.lbl_resend,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.focusScope!.unfocus();
                Get.toNamed(AppRoutes.signup);
              },
            style: Get.textTheme.bodySmall?.copyWith(
              color: Get.theme.customColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  void _showAlertSuccessfulDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
                style: Get.theme.textTheme.bodySmall!
                    .copyWith(color: Get.theme.customColors.greyTextColor),
              ),
              Gap(30.h),
              CustomElevatedButton(
                text: AppStrings.T.lbl_ok,
                onPressed: () {
                  Get.offAllNamed(AppRoutes.sigin);
                },
              )
            ],
          ),
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
