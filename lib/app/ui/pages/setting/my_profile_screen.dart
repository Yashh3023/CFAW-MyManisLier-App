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
    return Center(
      child: CircleAvatar(
        radius: 60.r,
        backgroundColor: Get.theme.customColors.bgColor,
        child: CustomImageView(
          imagePath: AssetConstants.pngProfilePhoto,
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextInputField(
      type: InputType.email,
      readOnly: true,
      prefixIcon: CustomImageView(
        imagePath: AssetConstants.icProfile,
        margin: const EdgeInsets.all(16),
        height: 28.h,
      ),
      controller: controller.editProfileNameController,
      hintLabel: AppStrings.T.nameLabel,
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
    );
  }

  @override
  bool get canDisposeController => true;

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
