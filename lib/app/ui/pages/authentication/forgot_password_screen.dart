import 'package:mymanislier/app/utils/helpers/exporter.dart';

class ForgotPasswordScreen extends GetItHook<AuthController> {
  ForgotPasswordScreen({super.key});

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
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppbar(
      appbarBgColor :Get.theme.customColors.black,
      onLeadingTap: Get.back,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Column(
          children: [
            _buildHeader(),
             Gap(50.h),
            _buildImageSection(),
             Gap(50.h),
            _buildEmailField(),
             Gap(30.h),
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
          AppStrings.T.forgotPassword,
          style: Get.theme.textTheme.headlineLarge!
              .copyWith(color: Get.theme.customColors.white),
        ),
         Gap(5.h),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: CenterText(
            AppStrings.T.lbl_forgor_password_subtitle,
            style: Get.theme.textTheme.labelMedium!
                .copyWith(color: Get.theme.customColors.greyTextColor),
          ),
        ),
      ],
    );
  }

  Widget _buildImageSection() {
    return CustomImageView(
      imagePath: AssetConstants.svgLockCircle,
    );
  }

  Widget _buildEmailField() {
    return TextInputField(
      type: InputType.email,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icEmail,
        margin:  EdgeInsets.symmetric(horizontal: 16.w),
        height: 28.h,
      ),
      controller: controller.forgotEmailController,
      hintLabel: AppStrings.T.email,
      validator: AppValidations.emailValidation,
    );
  }

  Widget _buildButtons() {
    return Obx(
      () {
        return CustomElevatedButton(
          isLoading: controller.forgotState.isLoading,
          isDisabled: controller.forgotState.isLoading,
          text: AppStrings.T.lbl_send_code,
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              Get.focusScope!.unfocus();
              Get.toNamed(AppRoutes.authenticationScreen);
            }
          },
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
