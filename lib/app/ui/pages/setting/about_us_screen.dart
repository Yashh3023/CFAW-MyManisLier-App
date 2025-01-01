import 'package:mymanislier/app/utils/helpers/exporter.dart';

class AboutUsScreen extends GetItHook<SettingController> {
  const AboutUsScreen({super.key});

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
        AppStrings.T.lbl_about_us,
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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.T.lbl_about_us,
              style: Get.theme.textTheme.labelSmall!.copyWith(
                color: Get.theme.customColors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(8.h),
            Text(
              'Could you please assist me in setting up this text? Lorem ipsum dolor sit amet consectetur. Aliquet ipsum molestie tellus lacus pellentesque fermentum nisl suscipit. Pulvinar feugiat hac a fringilla. Tellus. Lorem ipsum dolor sit amet consectetur. Aliquet ipsum molestie tellus lacus pellentesque fermentum nisl suscipit. Pulvinar feugiat hac a fringilla. Tellus. Lorem ipsum dolor sit amet consectetur. Aliquet ipsum molestie tellus lacus pellentesque fermentum nisl suscipit. Pulvinar feugiat hac a fringilla. Tellus. Aliquet ipsum molestie tellus lacus pellentesque fermentum nisl suscipit. Pulvinar feugiat hac a fringilla. Tellus.',
              textAlign: TextAlign.justify,
              style: Get.theme.textTheme.labelSmall!.copyWith(
                color: Get.theme.customColors.greyTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(8.h),
            Text(
              'Lorem ipsum dolor sit amet consectetur. Aliquet ipsum molestie tellus lacus pellentesque fermentum nisl suscipit. Pulvinar feugiat hac a fringilla. Tellus. Lorem ipsum dolor sit amet consectetur. Aliquet ipsum molestie tellus lacus pellentesque fermentum nisl suscipit. Pulvinar feugiat hac a fringilla. Tellus. Lorem ipsum dolor sit amet consectetur. Aliquet ipsum molestie tellus lacus pellentesque fermentum nisl suscipit. Pulvinar feugiat hac a fringilla. Tellus. Aliquet ipsum molestie tellus lacus pellentesque fermentum nisl suscipit. Pulvinar feugiat hac a fringilla. Tellus.',
              textAlign: TextAlign.justify,
              style: Get.theme.textTheme.labelSmall!.copyWith(
                color: Get.theme.customColors.greyTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
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
