import 'package:mymanislier/app/utils/helpers/exporter.dart';

class AuthenticationScreen extends GetItHook<AuthController> {
  AuthenticationScreen({super.key});

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
    final resetPasswordFormKey = GlobalKey<FormState>();

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
            Gap(30.h),
            _buildCodeSentMessage(),
            Gap(30.h),
            _buildButtons(resetPasswordFormKey),
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
      height: 200.h,
    );
  }

  Widget _buildOtpTextField() {
    return Center(
      child: Pinput(
        controller: controller.verificationCode,
        pinAnimationType: PinAnimationType.slide,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        validator: AppValidations.verificationCodeValidation,
        focusedPinTheme: _buildPinTheme(border: Get.theme.primaryColor),
        defaultPinTheme: _buildPinTheme(border: Get.theme.customColors.white),
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
          style: Get.theme.textTheme.labelMedium!.copyWith(
            color: Get.theme.customColors.grey,
            letterSpacing: 0.1,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CenterText(
            controller.forgotEmailController.text,
            style: Get.theme.textTheme.labelMedium!.copyWith(
              color: Get.theme.customColors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16.0.sp,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons(GlobalKey<FormState> resetPasswordFormKey) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomElevatedButton(
        text: AppStrings.T.lbl_verify_code,
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            Get.focusScope!.unfocus();
            Get.offAndToNamed(AppRoutes.resetPasswordScreen);
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
            text: AppStrings.T.lbl_dont_receive_code,
            style: Get.textTheme.bodySmall?.copyWith(
              color: Get.theme.customColors.greyTextColor,
            ),
          ),
          AppSpan(
            text: AppStrings.T.lbl_resend,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.focusScope!.unfocus();
              },
            style: Get.textTheme.bodySmall?.copyWith(
              color: Get.theme.customColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}
