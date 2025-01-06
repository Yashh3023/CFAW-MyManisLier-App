import 'dart:ui';

import 'package:mymanislier/app/utils/helpers/exporter.dart';

class SettingScreen extends GetItHook<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        AppStrings.T.lbl_settings,
        style: Get.theme.textTheme.bodyLarge!.copyWith(
          color: Get.theme.customColors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        SettingListTile(
          title: AppStrings.T.lbl_profile,
          iconPath: AssetConstants.icProfile,
          onTap: () {
            Get.toNamed(AppRoutes.myProfileScreen);
          },
        ),
        SettingListTile(
          title: AppStrings.T.lbl_change_password,
          iconPath: AssetConstants.icChangePassword,
          onTap: () {
            Get.toNamed(AppRoutes.changePasswordScreen);
          },
        ),
        SettingListTile(
          title: AppStrings.T.lbl_share_app,
          iconPath: AssetConstants.icShare,
          onTap: () {},
        ),
        SettingListTile(
          title: AppStrings.T.lbl_contact_us,
          iconPath: AssetConstants.icCall,
          onTap: () {
            Get.toNamed(AppRoutes.contactUsScreen);
          },
        ),
        SettingListTile(
          title: AppStrings.T.lbl_about_us,
          iconPath: AssetConstants.icInformation,
          onTap: () {
            Get.toNamed(AppRoutes.aboutUsScreen);
          },
        ),
        SettingListTile(
          title: AppStrings.T.lbl_privacy_policy,
          iconPath: AssetConstants.icShieldTick,
          onTap: () {
            Get.toNamed(AppRoutes.privacyPolicyScreen);
          },
        ),
        SettingListTile(
          title: AppStrings.T.lbl_terms_and_condition,
          iconPath: AssetConstants.icTermsNCondition,
          onTap: () {
            Get.toNamed(AppRoutes.termsNConditionsScreen);
          },
        ),
        SettingListTile(
          title: AppStrings.T.lbl_delete_account,
          iconPath: AssetConstants.icDelete,
          onTap: () {
            Get.toNamed(AppRoutes.deleteAccountScreen);
          },
        ),
        SettingListTile(
          title: AppStrings.T.lbl_faq,
          iconPath: AssetConstants.icMessageQuestion,
          onTap: () {
            Get.toNamed(AppRoutes.faqScreen);
          },
        ),
        SettingListTile(
          title: AppStrings.T.lbl_sign_out,
          iconPath: AssetConstants.icLogout,
          onTap: () {
            _showSignoutDialog();
          },
        ),
      ],
    );
  }

  void _showSignoutDialog() {
    Get.dialog(
      Stack(
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
              content: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 47.r,
                      backgroundColor: Get.theme.customColors.primaryColor,
                      child: CustomImageView(
                        width: 50.w,
                        height: 50..h,
                        imagePath: AssetConstants.pngSignout,
                      ),
                    ),
                    Gap(20.h),
                    CenterText(
                      AppStrings.T.lbl_sign_out,
                      style: Get.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 26.sp,
                          color: Get.theme.customColors.white),
                    ),
                    Gap(20.h),
                    CenterText(
                      AppStrings.T.lbl_sign_out_q,
                      style: Get.textTheme.bodyMedium?.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Get.theme.customColors.greyTextColor),
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          text: AppStrings.T.lbl_yes,
                          secondary: true,
                          buttonStyle: ButtonThemeHelper.secondaryButtonStyle(
                              Get.context!),
                          onPressed: () {
                            Get.focusScope!.unfocus();
                            Get.toNamed(AppRoutes.sigin);
                          },
                        ),
                      ),
                      Gap(16.w),
                      Expanded(
                        child: CustomElevatedButton(
                          text: AppStrings.T.lbl_no,
                          onPressed: Get.back,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
        margin: EdgeInsets.only(bottom: 16.h),
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
