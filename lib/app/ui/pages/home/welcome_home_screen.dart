import 'package:mymanislier/app/utils/helpers/exporter.dart';

class WelcomeHomeScreen extends GetItHook<HomeController> {
  WelcomeHomeScreen({super.key});

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
      hasLeadingIcon: false,
      title: Text(
        AppStrings.T.lbl_welcome,
        style: Get.theme.textTheme.bodyLarge!.copyWith(
          color: Get.theme.customColors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        CircleAvatar(
          radius: 23,
          backgroundColor: Get.theme.customColors.appBarIcBg,
          child: CustomImageView(
            imagePath: AssetConstants.icSetting,
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 30.h,
          bottom: 28.h,
          right: 20.w,
          left: 20.w,
        ),
        child: Column(
          children: [
            _buildHeader(),
            Gap(25.h),
            _buildNameField(),
            Gap(16.h),
            _buildPartnerNameField(),
            Gap(16.h),
            _buildTextconversationField(),
            Gap(30.h),
            _buildOrText(),
            Gap(30.h),
            _buildUploadImages(),
            Gap(54.h),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: CenterText(
        AppStrings.T.lbl_analyze_a_conversation,
        style: Get.theme.textTheme.headlineLarge!
            .copyWith(color: Get.theme.customColors.white),
      ),
    );
  }

  Widget _buildNameField() {
    return TextInputField(
      type: InputType.text,
      keyboardType: TextInputType.text,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icUser,
        margin: const EdgeInsets.all(16),
        height: 28.h,
      ),
      controller: controller.nameController,
      hintLabel: AppStrings.T.lbl_your_name,
      validator: AppValidations.nameValidation,
    );
  }

  Widget _buildPartnerNameField() {
    return TextInputField(
      type: InputType.text,
      keyboardType: TextInputType.text,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icProfileTwoUser,
        margin: const EdgeInsets.all(16),
        height: 28.h,
      ),
      controller: controller.partnerNameController,
      hintLabel: AppStrings.T.lbl_partner_name,
      validator: AppValidations.nameValidation,
    );
  }

  Widget _buildTextconversationField() {
    return Stack(
      children: [
        TextInputField(
          type: InputType.text,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          borderRadius: 16.h,
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
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  Container(
                    height: 24.h,
                    width: 2.w,
                    color: const Color(0XFF2D2E30),
                  )
                ],
              ),
            ),
          ),
          controller: controller.pasteTextConversaionController,
          hintLabel: AppStrings.T.lbl_paste_text_conversaion_here,
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: Get.theme.customColors.black,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
              child: CenterText(
                AppStrings.T.lbl_paste,
                style:
                    Get.theme.textTheme.labelSmall!.copyWith(fontSize: 12.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrText() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color.fromRGBO(36, 37, 44, 0.4),
                  Color.fromRGBO(36, 37, 44, 0),
                ],
              ),
            ),
          ),
        ),
        CenterText(
          AppStrings.T.lbl_or,
          style: Get.theme.textTheme.bodySmall!
              .copyWith(color: Get.theme.customColors.greyTextColor),
        ),
        Expanded(
          child: Container(
            height: 2.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(36, 37, 44, 0.4),
                  Color.fromRGBO(36, 37, 44, 0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadImages() {
    return ImagePickerWidget(
      onImagesSelected: (selectedImages) {
        debugPrint('Selected images: $selectedImages');
      },
    );
  }

  Widget _buildButtons() {
    return Obx(
      () => CustomElevatedButton(
        isLoading: controller.uploadeState.isLoading,
        isDisabled: controller.uploadeState.isLoading,
        text: AppStrings.T.lbl_next,
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            Get.focusScope!.unfocus();
            controller.upload(_formKey.currentState);
          }
        },
      ),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {
    controller.resetValues();
  }

  @override
  void onInit() {}
}
