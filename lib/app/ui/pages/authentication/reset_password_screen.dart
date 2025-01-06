import 'dart:ui';

import 'package:mymanislier/app/utils/helpers/exporter.dart';

class ResetPasswordScreen extends GetItHook<AuthController> {
  ResetPasswordScreen({super.key});

  final newPasswordObscure = true.obs;
  final confirmNewPasswordObscure = true.obs;

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
      appbarBgColor: Get.theme.customColors.black,
      onLeadingTap: Get.back,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom / 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            _buildHeader(),
            Gap(32.h),
            _buildImageSection(),
            Gap(32.h),
            _buildNewPasswordField(),
            Gap(16.h),
            _buildConformNewPasswordField(),
            Gap(32.h),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        CenterText(
          AppStrings.T.resetPassword,
          style: Get.theme.textTheme.headlineLarge!
              .copyWith(color: Get.theme.customColors.white),
        ),
        Gap(10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: CenterText(
            AppStrings.T.lbl_new_password_suggetion,
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
      imagePath: AssetConstants.pngResetPassword,
      height: 200.h,
    );
  }

  Widget _buildNewPasswordField() {
    return Obx(
      () => TextInputField(
        type: InputType.password,
        keyboardType: TextInputType.visiblePassword,
        prefixIcon: CustomImageView(
          imagePath: AssetConstants.icLock,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          height: 28.h,
        ),
        suffixIcon: CustomImageView(
          imagePath: newPasswordObscure.value
              ? AssetConstants.icSeenOff
              : AssetConstants.icSeen,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          height: 28.h,
          onTap: () {
            newPasswordObscure.value = !newPasswordObscure.value;
          },
        ),
        controller: controller.newPasswordController,
        hintLabel: AppStrings.T.lbl_new_password,
        obscureText: newPasswordObscure.value.obs,
        textInputAction: TextInputAction.next,
        validator: (value) => AppValidations.validateRequired(value,
            fieldName: AppStrings.T.lbl_new_password_small),
        onFieldSubmitted: (_) {
          FocusScope.of(Get.context!)
              .requestFocus(controller.confirmPassfocusnode);
        },
      ),
    );
  }

  Widget _buildConformNewPasswordField() {
    return Obx(
      () => TextInputField(
        focusNode: controller.confirmPassfocusnode,
        type: InputType.password,
        prefixIcon: CustomImageView(
          imagePath: AssetConstants.icLock,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          height: 28.h,
        ),
        suffixIcon: CustomImageView(
          imagePath: confirmNewPasswordObscure.value
              ? AssetConstants.icSeenOff
              : AssetConstants.icSeen,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          height: 28.h,
          onTap: () {
            confirmNewPasswordObscure.value = !confirmNewPasswordObscure.value;
          },
        ),
        controller: controller.confirmNewPasswordController,
        hintLabel: AppStrings.T.lbl_confirm_new_password,
        obscureText: confirmNewPasswordObscure.value.obs,
        textInputAction: TextInputAction.done,
        validator: (value) {
          return AppValidations.confirmPasswordValidation(
            value,
            controller.newPasswordController.text,
          );
        },
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Obx(
      () {
        return CustomElevatedButton(
          isLoading: controller.forgotState.isLoading,
          isDisabled: controller.forgotState.isLoading,
          text: AppStrings.T.lbl_update,
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              Get.focusScope!.unfocus();
              _showAlertSuccessfulDialog(context);
            }
          },
        );
      },
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
                      imagePath: AssetConstants.svgSuccessful,
                    ),
                    Gap(20.h),
                    CenterText(
                      AppStrings.T.lbl_successful,
                      style: Get.theme.textTheme.headlineLarge!
                          .copyWith(color: Get.theme.customColors.white),
                    ),
                    Gap(15.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                      child: CenterText(
                        AppStrings.T.lbl_congratilation_message_for_success,
                        style: Get.theme.textTheme.bodySmall!.copyWith(
                            color: Get.theme.customColors.grey,
                            fontSize: 16.0.sp),
                      ),
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
