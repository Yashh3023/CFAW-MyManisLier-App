import 'package:mymanislier/app/utils/helpers/exporter.dart';

class ContactUsScreen extends GetItHook<SettingController> {
  ContactUsScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.cantactUsEmailController.text = "devinci@gmail.com";

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
        AppStrings.T.lbl_contact_us,
        style: Get.theme.textTheme.bodyLarge!.copyWith(
          color: Get.theme.customColors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            _buildNameField(),
            Gap(16.h),
            _buildEmailField(),
            Gap(16.h),
            _buildSubjectField(),
            Gap(16.h),
            _buildMessageField(),
            Gap(30.h),
            _buildsubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextInputField(
      type: InputType.text,
      keyboardType: TextInputType.text,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icProfile,
        margin: const EdgeInsets.all(16),
        height: 28.h,
      ),
      controller: controller.cantactUsNameController,
      hintLabel: AppStrings.T.nameLabel,
      validator: AppValidations.nameValidation,
    );
  }

  Widget _buildEmailField() {
    return TextInputField(
      type: InputType.email,
      readOnly: true,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icEmail,
        margin: const EdgeInsets.all(16),
        height: 28.h,
      ),
      style: Get.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: Get.theme.customColors.grey,
      ),
      controller: controller.cantactUsEmailController,
      hintLabel: AppStrings.T.email,
      validator: AppValidations.emailValidation,
    );
  }

  Widget _buildSubjectField() {
    return TextInputField(
      type: InputType.text,
      keyboardType: TextInputType.text,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icDiscover,
        margin: const EdgeInsets.all(16),
        height: 28.h,
      ),
      controller: controller.cantactUsSubjectController,
      hintLabel: AppStrings.T.lbl_subject,
      validator: (value) => AppValidations.validateRequired(value,
          fieldName: AppStrings.T.lbl_subject_small),
    );
  }

  Widget _buildMessageField() {
    return TextInputField(
      type: InputType.text,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      maxLines: 3,
      borderRadius: 16.r,
      prefixIcon: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Align(
          alignment: Alignment.topCenter,
          widthFactor: 1.11.w,
          heightFactor: 5.h,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: AssetConstants.icMessageMinus,
                margin: EdgeInsets.symmetric(horizontal: 16.w),
              ),
              Container(
                height: 24.h,
                width: 2.w,
                color: Get.theme.customColors.pastetext,
              )
            ],
          ),
        ),
      ),
      controller: controller.cantactUsMessageController,
      hintLabel: AppStrings.T.lbl_your_message,
      validator: (value) => AppValidations.validateRequired(value,
          fieldName: AppStrings.T.lbl_your_message_small),
    );
  }

  Widget _buildsubmitButton() {
    return CustomElevatedButton(
      text: AppStrings.T.lbl_submit,
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Get.focusScope!.unfocus();
          Get.offAndToNamed(AppRoutes.settingScreen);
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
