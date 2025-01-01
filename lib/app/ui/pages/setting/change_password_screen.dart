import 'package:mymanislier/app/utils/helpers/exporter.dart';

class ChangePasswordScreen extends GetItHook<SettingController> {
  ChangePasswordScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.editProfileNameController.text = "David Vinci";
    controller.editProfileEmailController.text = "devinci@gmail.com";
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Get.theme.customColors.black,
        appBar: _buildAppBar(),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppbar(
      hasLeadingIcon: true,
      backArroBgColor: Get.theme.customColors.appBarIcBg,
      title: Text(
        AppStrings.T.lbl_change_password,
        style: Get.theme.textTheme.bodyLarge!.copyWith(
          color: Get.theme.customColors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCurrentPasswordField(),
            Gap(16.h),
            _buildNewPasswordField(),
            Gap(16.h),
            _buildConfirmNewPasswordField(),
            Gap(30.h),
            _buildButtons()
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentPasswordField() {
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
          imagePath: controller.currentPassObscure.value
              ? AssetConstants.icSeenOff
              : AssetConstants.icSeen,
          margin: const EdgeInsets.all(16),
          height: 28.h,
          onTap: () {
            controller.currentPassObscure.value =
                !controller.currentPassObscure.value;
          },
        ),
        controller: controller.changePasswordController,
        hintLabel: AppStrings.T.lbl_current_password,
        obscureText: controller.currentPassObscure.value.obs,
        validator: AppValidations.passwordValidation,
        onFieldSubmitted: (_) {
          FocusScope.of(Get.context!).requestFocus(controller.newPassfocusnode);
        },
      ),
    );
  }

  Widget _buildNewPasswordField() {
    return Obx(
      () => TextInputField(
        focusNode: controller.newPassfocusnode,
        type: InputType.password,
        keyboardType: TextInputType.visiblePassword,
        prefixIcon: CustomImageView(
          imagePath: AssetConstants.icLock,
          margin: const EdgeInsets.all(16),
          height: 28.h,
        ),
        suffixIcon: CustomImageView(
          imagePath: controller.newPassObscure.value
              ? AssetConstants.icSeenOff
              : AssetConstants.icSeen,
          margin: const EdgeInsets.all(16),
          height: 28.h,
          onTap: () {
            controller.newPassObscure.value = !controller.newPassObscure.value;
          },
        ),
        controller: controller.changeNewPasswordController,
        hintLabel: AppStrings.T.lbl_new_password,
        obscureText: controller.newPassObscure.value.obs,
        validator: AppValidations.passwordValidation,
        onFieldSubmitted: (_) {
          FocusScope.of(Get.context!)
              .requestFocus(controller.confirmNewPassfocusnode);
        },
      ),
    );
  }

  Widget _buildConfirmNewPasswordField() {
    return Obx(
      () => TextInputField(
        focusNode: controller.confirmNewPassfocusnode,
        type: InputType.password,
        keyboardType: TextInputType.visiblePassword,
        prefixIcon: CustomImageView(
          imagePath: AssetConstants.icLock,
          margin: const EdgeInsets.all(16),
          height: 28.h,
        ),
        suffixIcon: CustomImageView(
          imagePath: controller.confirmNewPassObscure.value
              ? AssetConstants.icSeenOff
              : AssetConstants.icSeen,
          margin: const EdgeInsets.all(16),
          height: 28.h,
          onTap: () {
            controller.confirmNewPassObscure.value =
                !controller.confirmNewPassObscure.value;
          },
        ),
        controller: controller.changeConfirmNewPasswordController,
        hintLabel: AppStrings.T.lbl_confirm_new_password,
        obscureText: controller.confirmNewPassObscure.value.obs,
        textInputAction: TextInputAction.done,
        validator: (value) {
          return AppValidations.confirmPasswordValidation(
            value,
            controller.changeNewPasswordController.text,
          );
        },
      ),
    );
  }

  Widget _buildButtons() {
    return CustomElevatedButton(
      text: AppStrings.T.lbl_update,
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Get.focusScope!.unfocus();
        }
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
