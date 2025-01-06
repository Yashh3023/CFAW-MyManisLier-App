import 'dart:io';
import 'dart:ui';
import 'package:mymanislier/app/utils/helpers/exporter.dart';

class EditProfileScreen extends GetItHook<SettingController> {
  EditProfileScreen({super.key});

  final ImagePicker _picker = ImagePicker();
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
        AppStrings.T.lbl_edit_profile,
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
            _buildSelectPhotoForm(),
            Gap(30.h),
            _buildNameField(),
            Gap(16.h),
            _buildEmailField(),
            Gap(30.h),
            _buildButtons()
          ],
        ),
      ),
    );
  }

  Widget _buildSelectPhotoForm() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Obx(
          () => CircleAvatar(
            radius: 60.r,
            backgroundColor: Get.theme.customColors.greyBg,
            backgroundImage: controller.selectedImage.value != null
                ? FileImage(controller.selectedImage.value!)
                : null,
            child: controller.selectedImage.value == null
                ? CustomImageView(imagePath: AssetConstants.pngProfilePhoto)
                : null,
          ),
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
                imagePath: AssetConstants.icEdit,
              ),
            ),
          ),
        ),
      ],
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
                                  Navigator.pop(context);
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
                                                color: Get
                                                    .theme.customColors.white),
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
                                  Navigator.pop(context);
                                  _pickImage(ImageSource.gallery);
                                },
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    color: Get.theme.customColors.greyBg,
                                    borderRadius: BorderRadius.circular(14.44),
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
                                                color: Get
                                                    .theme.customColors.white),
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
                      onPressed: () {},
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

  Widget _buildNameField() {
    return TextInputField(
      type: InputType.text,
      keyboardType: TextInputType.text,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icProfile,
        margin: const EdgeInsets.all(16),
        height: 28.h,
      ),
      controller: controller.editProfileNameController,
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
      controller: controller.editProfileEmailController,
      hintLabel: AppStrings.T.email,
      validator: AppValidations.emailValidation,
    );
  }

  Widget _buildButtons() {
    return CustomElevatedButton(
      text: AppStrings.T.lbl_update,
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Get.focusScope!.unfocus();
          _showAlertSuccessfulDialog(Get.context!);
        }
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
                      imagePath: AssetConstants.svgCongratulation,
                    ),
                    Gap(20.h),
                    CenterText(
                      AppStrings.T.lbl_profile_updated,
                      style: Get.theme.textTheme.headlineLarge!
                          .copyWith(color: Get.theme.customColors.white),
                    ),
                    Gap(14.h),
                    CenterText(
                      AppStrings.T.lbl_profile_updated_discription,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                          color: Get.theme.customColors.greyTextColor),
                    ),
                    Gap(30.h),
                    CustomElevatedButton(
                      text: AppStrings.T.lbl_ok,
                      onPressed: () {
                        Get.back();
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

  @override
  bool get canDisposeController => true;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}
