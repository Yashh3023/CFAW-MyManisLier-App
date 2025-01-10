import 'package:mymanislier/app/utils/helpers/exporter.dart';

class MyProfileScreen extends GetItHook<SettingController> {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.editProfileNameController.text = "David Vinci";
    controller.editProfileEmailController.text = "devinci@gmail.com";

    return Scaffold(
      backgroundColor: Get.theme.customColors.black,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppbar(
      hasLeadingIcon: true,
      backArroBgColor: Get.theme.customColors.appBarIcBg,
      title: Text(
        AppStrings.T.lbl_profile,
        style: Get.theme.textTheme.bodyLarge!.copyWith(
          color: Get.theme.customColors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.editProfileScreen);
          },
          child: CircleAvatar(
            radius: 23,
            backgroundColor: Get.theme.customColors.appBarIcBg,
            child: CustomImageView(
              imagePath: AssetConstants.icEdit,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfilePhoto(),
          Gap(30.h),
          _buildNameField(),
          Gap(16.h),
          _buildEmailField(),
        ],
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Obx(
      () => Center(
        child: CircleAvatar(
          radius: 70.r,
          backgroundColor: Get.theme.customColors.greyBg,
          backgroundImage: controller.tempSelectedImage.value != null
              ? FileImage(controller.tempSelectedImage.value!)
              : null,
          child: controller.tempSelectedImage.value == null
              ? CustomImageView(imagePath: AssetConstants.pngProfilePhoto)
              : null,
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextInputField(
      type: InputType.name,
      readOnly: true,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icProfile,
        margin: const EdgeInsets.all(16),
        height: 28.h,
      ),
      controller: controller.editProfileNameController,
      hintLabel: AppStrings.T.nameLabel,
      style: Get.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 18,
        color: Get.theme.customColors.grey,
      ),
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
      controller: controller.editProfileEmailController,
      hintLabel: AppStrings.T.email,
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}

class SettingListTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const SettingListTile({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Get.theme.customColors.bgColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Get.theme.customColors.darkGreyBorder!,
            width: 1.w,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomImageView(
                    color: Get.theme.customColors.white,
                    imagePath: iconPath,
                  ),
                  Gap(12.w),
                  Text(
                    title,
                    style: Get.theme.textTheme.bodyLarge!.copyWith(
                      color: Get.theme.customColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              CustomImageView(
                imagePath: AssetConstants.icArrow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
