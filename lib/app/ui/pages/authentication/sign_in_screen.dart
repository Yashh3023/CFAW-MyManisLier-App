import 'package:mymanislier/app/utils/helpers/exporter.dart';

class SignInScreen extends GetItHook<AuthController> {
  SignInScreen({super.key});

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
        bottomNavigationBar: _buildRegisterRedirect(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppbar(
      appbarBgColor: Get.theme.customColors.black,
      hasLeadingIcon: false,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom / 4),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
        child: Column(
          children: [
            _buildHeader(),
            Gap(33.h),
            _buildEmailField(),
            Gap(16.h),
            _buildPasswordField(),
            Gap(16.h),
            _buildForgotPassword(),
            Gap(38.h),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        CenterText(
          AppStrings.T.lbl_get_welcome_back,
          style: Get.theme.textTheme.headlineLarge!
              .copyWith(color: Get.theme.customColors.white),
        ),
        Gap(15.h),
        CenterText(
          AppStrings.T.lbl_get_sign_in_message,
          style: Get.theme.textTheme.labelMedium!.copyWith(
              color: Get.theme.customColors.grey,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.1,
              fontSize: 16.0.sp),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return TextInputField(
      type: InputType.email,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icEmail,
        margin: const EdgeInsets.all(16),
        height: 28.h,
      ),
      controller: controller.emailController,
      hintLabel: AppStrings.T.email,
      validator: AppValidations.emailValidation,
    );
  }

  Widget _buildPasswordField() {
    return Obx(
      () => TextInputField(
        type: InputType.password,
        keyboardType: TextInputType.visiblePassword,
        prefixIcon: CustomImageView(
          imagePath: AssetConstants.icLock,
          margin: const EdgeInsets.all(16),
          height: 28.h,
        ),
        suffixIcon: CustomImageView(
          imagePath: passObscure.value
              ? AssetConstants.icSeenOff
              : AssetConstants.icSeen,
          margin: const EdgeInsets.all(16),
          height: 28.h,
          onTap: () {
            passObscure.value = !passObscure.value;
          },
        ),
        controller: controller.passwordController,
        hintLabel: AppStrings.T.password,
        obscureText: passObscure.value.obs,
        textInputAction: TextInputAction.done,
        validator: AppValidations.passwordValidation,
      ),
    );
  }

  Widget _buildForgotPassword() {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Get.toNamed(AppRoutes.forgotPasswordScreen);
      },
      child: Align(
        alignment: Alignment.topRight,
        child: AppText(
          AppStrings.T.forgotPassword,
          style: Get.theme.textTheme.labelMedium?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              decorationColor: Get.theme.customColors.secondaryColor,
              color: Get.theme.customColors.secondaryColor),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Obx(
      () => CustomElevatedButton(
        isLoading: controller.signinState.isLoading,
        isDisabled: controller.signinState.isLoading,
        text: AppStrings.T.signin,
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            Get.focusScope!.unfocus();
            controller.signIn(_formKey.currentState);
          }
        },
      ),
    );
  }

  Widget _buildRegisterRedirect() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: AppRichText(
        spans: [
          AppSpan(
            text: AppStrings.T.registerRedirect,
            style: Get.textTheme.bodySmall?.copyWith(
              color: Get.theme.customColors.grey,
            ),
          ),
          AppSpan(
            text: AppStrings.T.signup,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.focusScope!.unfocus();
                Get.toNamed(AppRoutes.signup);
              },
            style: Get.textTheme.bodySmall?.copyWith(
                color: Get.theme.customColors.secondaryColor,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  @override
  bool get canDisposeController => true;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}
