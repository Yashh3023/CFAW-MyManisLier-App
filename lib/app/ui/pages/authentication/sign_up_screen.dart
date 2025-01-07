import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:mymanislier/app/utils/helpers/exporter.dart';

class SignUpScreen extends GetItHook<AuthController> {
  SignUpScreen({super.key});

  final passObscure = true.obs;
  final confirmPassObscure = true.obs;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

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
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            _buildHeader(),
            Gap(30.h),
            _buildSelectPhotoForm(),
            Gap(40.h),
            _buildUserNameField(),
            Gap(16.h),
            _buildEmailField(),
            Gap(16.h),
            _buildPasswordField(),
            Gap(16.h),
            _buildConfirmPasswordField(),
            Gap(16.h),
            _buildUserAgreementForm(),
            Gap(38.h),
            _buildButtons(),
            Gap(16.h),
            _buildLoginRedirect(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        CenterText(
          AppStrings.T.lbl_create_new_account,
          style: Get.theme.textTheme.headlineLarge!
              .copyWith(color: Get.theme.customColors.white),
        ),
        Gap(10.h),
        CenterText(
          AppStrings.T.lbl_please_enter_your_detsil,
          style: Get.theme.textTheme.labelMedium!.copyWith(
            color: Get.theme.customColors.grey,
            letterSpacing: 0.1,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildSelectPhotoForm() {
    return Obx(
      () => Stack(
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 70.r,
            backgroundColor: Get.theme.customColors.greyBg,
            backgroundImage: controller.tempSelectedImage.value != null
                ? FileImage(controller.tempSelectedImage.value!)
                : null,
            child: controller.tempSelectedImage.value == null
                ? CustomImageView(imagePath: AssetConstants.svgProfile)
                : null,
          ),
          Positioned(
            bottom: 0.h,
            right: 0.w,
            child: GestureDetector(
              onTap: () {
                _chooseActionDialog(Get.context!);
              },
              child: CircleAvatar(
                radius: 17.r,
                backgroundColor: Get.theme.customColors.primaryColor,
                child: CustomImageView(
                  height: 17.h,
                  imagePath: controller.tempSelectedImage.value == null
                      ? AssetConstants.icCamera
                      : AssetConstants.icEdit,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _chooseActionDialog(BuildContext context) {
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
                    CenterText(
                      AppStrings.T.lbl_choose_an_action,
                      style: Get.theme.textTheme.headlineLarge!
                          .copyWith(color: Get.theme.customColors.white),
                    ),
                    Gap(4.h),
                    CenterText(
                      AppStrings.T.lbl_capture_or_select_image,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                          color: Get.theme.customColors.greyTextColor),
                    ),
                    Gap(30.h),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Get.theme.customColors.black,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _pickImage(ImageSource.camera);
                                },
                                child: Container(
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                    color: Get.theme.customColors.greyBg,
                                    borderRadius:
                                        BorderRadius.circular(14.44.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomImageView(
                                        imagePath: AssetConstants.icCamera,
                                      ),
                                      Gap(10.w),
                                      CenterText(
                                        AppStrings.T.lbl_camera,
                                        style: Get.theme.textTheme.bodySmall!
                                            .copyWith(
                                          color: Get.theme.customColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Gap(10.w),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _pickImage(ImageSource.gallery);
                                },
                                child: Container(
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                    color: Get.theme.customColors.greyBg,
                                    borderRadius:
                                        BorderRadius.circular(14.44.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomImageView(
                                        imagePath: AssetConstants.icGallery,
                                      ),
                                      Gap(10.h),
                                      CenterText(
                                        AppStrings.T.lbl_gallery,
                                        style: Get.theme.textTheme.bodySmall!
                                            .copyWith(
                                          color: Get.theme.customColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(40.h),
                    CustomElevatedButton(
                      text: AppStrings.T.lbl_ok,
                      onPressed: () {
                        controller.tempSelectedImage.value =
                            controller.selectedImage.value;
                        Get.back();
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

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        controller.selectedImage.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar(
          AppStrings.T.error, AppStrings.T.lbl_failed_to_pick_an_image);
    }
  }

  Widget _buildUserNameField() {
    return TextInputField(
      type: InputType.name,
      keyboardType: TextInputType.text,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icProfile,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        height: 28.h,
      ),
      controller: controller.signupUsernameController,
      hintLabel: AppStrings.T.lbl_username,
      validator: (value) => AppValidations.validateRequired(value,
          fieldName: AppStrings.T.lbl_username_small),
    );
  }

  Widget _buildEmailField() {
    return TextInputField(
      type: InputType.email,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icEmail,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        height: 28.h,
      ),
      controller: controller.signupEmailController,
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
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          height: 28.h,
        ),
        suffixIcon: CustomImageView(
          imagePath: passObscure.value
              ? AssetConstants.icSeenOff
              : AssetConstants.icSeen,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          height: 28.h,
          onTap: () {
            passObscure.value = !passObscure.value;
          },
        ),
        controller: controller.signupPasswordController,
        hintLabel: AppStrings.T.password,
        obscureText: passObscure.value.obs,
        validator: AppValidations.passwordValidation,
        onFieldSubmitted: (_) {
          FocusScope.of(Get.context!)
              .requestFocus(controller.signupconfirmPassfocusnode);
        },
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return Obx(
      () => TextInputField(
        type: InputType.password,
        focusNode: controller.signupconfirmPassfocusnode,
        keyboardType: TextInputType.visiblePassword,
        prefixIcon: CustomImageView(
          imagePath: AssetConstants.icLock,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          height: 28.h,
        ),
        suffixIcon: CustomImageView(
          imagePath: confirmPassObscure.value
              ? AssetConstants.icSeenOff
              : AssetConstants.icSeen,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          height: 28.h,
          onTap: () {
            confirmPassObscure.value = !confirmPassObscure.value;
          },
        ),
        controller: controller.signupConfirmPasswordController,
        hintLabel: AppStrings.T.lbl_confirm_password,
        obscureText: confirmPassObscure.value.obs,
        textInputAction: TextInputAction.done,
        validator: (value) {
          return AppValidations.confirmPasswordValidation(
            value,
            controller.signupPasswordController.text,
          );
        },
      ),
    );
  }

  Widget _buildUserAgreementForm() {
    return Row(
      children: [
        Obx(
          () => Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: controller.userAgreementCheck.value,
              onChanged: (value) {
                controller.userAgreementCheck.value =
                    !controller.userAgreementCheck.value;
              },
            ),
          ),
        ),
        Gap(8.w),
        Expanded(
          child: AppRichText(
            maxLines: 2,
            textAlign: TextAlign.start,
            spans: [
              AppSpan(
                text: AppStrings.T.lbl_i_agree_to_the,
                style: Get.textTheme.bodySmall?.copyWith(
                  color: Get.theme.customColors.greyTextColor,
                ),
              ),
              AppSpan(
                text: AppStrings.T.lbl_privacy_policy,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.focusScope!.unfocus();
                    Get.toNamed(AppRoutes.privacyPolicyScreen);
                  },
                style: Get.textTheme.bodySmall?.copyWith(
                    color: Get.theme.customColors.secondaryColor,
                    decorationColor: Get.theme.customColors.secondaryColor,
                    decoration: TextDecoration.underline),
              ),
              AppSpan(
                text: AppStrings.T.lbl_and,
                style: Get.textTheme.bodySmall?.copyWith(
                  color: Get.theme.customColors.greyTextColor,
                ),
              ),
              AppSpan(
                text: '${AppStrings.T.lbl_terms_and_condition}.',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.focusScope!.unfocus();
                    Get.toNamed(AppRoutes.termsNConditionsScreen);
                  },
                style: Get.textTheme.bodySmall?.copyWith(
                    color: Get.theme.customColors.secondaryColor,
                    decorationColor: Get.theme.customColors.secondaryColor,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Obx(
      () => CustomElevatedButton(
        isLoading: controller.signinState.isLoading,
        isDisabled: controller.signinState.isLoading,
        text: AppStrings.T.signup,
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            Get.focusScope!.unfocus();
            controller.signUp(_formKey.currentState);
          }
        },
      ),
    );
  }

  Widget _buildLoginRedirect() {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: AppRichText(
        spans: [
          AppSpan(
            text: AppStrings.T.loginRedirect,
            style: Get.textTheme.bodySmall?.copyWith(
              color: Get.theme.customColors.greyTextColor,
            ),
          ),
          AppSpan(
            text: AppStrings.T.signin,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.focusScope!.unfocus();
                Get.offAllNamed(AppRoutes.sigin);
              },
            style: Get.textTheme.bodySmall?.copyWith(
              color: Get.theme.customColors.secondaryColor,
              fontSize: 16.0.sp,
            ),
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
