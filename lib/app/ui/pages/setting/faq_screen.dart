import 'package:mymanislier/app/utils/helpers/exporter.dart';

class FaqScreen extends GetItHook<SettingController> {
  const FaqScreen({super.key});

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
        AppStrings.T.lbl_faq,
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
            _expansionTile(),
            Gap(16.h),
            _expansionTile(),
            Gap(16.h),
            _expansionTile(),
          ],
        ),
      ),
    );
  }

  Widget _expansionTile() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Get.theme.customColors.textfieldFillColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Get.theme.customColors.darkGreyBorder!,
          width: 1.w,
        ),
      ),
      child: Theme(
        data: Theme.of(Get.context!).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          iconColor: Get.theme.customColors.greyTextColor,
          title: Text(
            AppStrings.T.lbl_assist_text_question,
            style: Get.theme.textTheme.labelSmall!.copyWith(
                color: Get.theme.customColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                AppStrings.T.lbl_assist_text_question,
                style: Get.theme.textTheme.labelSmall!.copyWith(
                    color: Get.theme.customColors.greyTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500),
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
