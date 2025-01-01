import 'package:mymanislier/app/utils/helpers/exporter.dart';

class ContactUsScreen extends GetItHook<SettingController> {
  ContactUsScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
      validator: AppValidations.emailValidation,
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
        imagePath: AssetConstants.icEmail,
        margin: const EdgeInsets.all(16),
        height: 28.h,
      ),
      controller: controller.cantactUsSubjectController,
      hintLabel: AppStrings.T.email,
      validator: AppValidations.emailValidation,
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
          widthFactor: 1,
          heightFactor: 4,
          child: CustomImageView(
            imagePath: AssetConstants.icMessageMinus,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          ),
        ),
      ),
      controller: controller.cantactUsMessageController,
      hintLabel: AppStrings.T.lbl_your_message,
      validator: AppValidations.validateRequired,
    );
  }

  Widget _buildsubmitButton() {
    return CustomElevatedButton(
      text: AppStrings.T.lbl_submit,
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