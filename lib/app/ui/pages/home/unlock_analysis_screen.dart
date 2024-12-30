import 'package:mymanislier/app/utils/helpers/exporter.dart';

class UnlockAnalysisScreen extends GetItHook<HomeController> {
  const UnlockAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.customColors.black,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildButtons(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppbar(
      hasLeadingIcon: true,
      backArroBgColor: Get.theme.customColors.appBarIcBg,
      title: Text(
        AppStrings.T.lbl_unlock_your_analysis,
        style: Get.theme.textTheme.bodyLarge!.copyWith(
          color: Get.theme.customColors.white,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
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
            Gap(30.h),
            _buildDivider(),
            Gap(27.5.h),
            _buildDetailColumn(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: CustomImageView(
        imagePath: AssetConstants.svgUnlock,
      ),
    );
  }

  Widget _buildDivider() {
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
                  Color.fromRGBO(134, 135, 137, 0.2),
                  Color.fromRGBO(36, 37, 44, 0.2),
                ],
              ),
            ),
          ),
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
                  Color.fromRGBO(134, 135, 137, 0.2),
                  Color.fromRGBO(36, 37, 44, 0.2),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailColumn() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                  color: Get.theme.customColors.bgColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomImageView(
                  imagePath: AssetConstants.icPieChart,
                ),
              ),
            ),
            Gap(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.T.lbl_sentiment_analysis,
                    style: Get.theme.textTheme.bodySmall!.copyWith(
                      color: Get.theme.customColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(2.h),
                  Text(
                    AppStrings.T.lbl_sentiment_analysis_description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Get.theme.textTheme.bodySmall!.copyWith(
                      color: Get.theme.customColors.greyTextColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Gap(16.h),
        Divider(
          color: Get.theme.customColors.bgColor,
        ),
        Row(
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                  color: Get.theme.customColors.bgColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomImageView(
                  imagePath: AssetConstants.icSearch,
                ),
              ),
            ),
            Gap(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.T.lbl_behavioural_insights,
                    style: Get.theme.textTheme.bodySmall!.copyWith(
                      color: Get.theme.customColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(2.h),
                  Text(
                    AppStrings.T.lbl_behavioural_insights_description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Get.theme.textTheme.bodySmall!.copyWith(
                      color: Get.theme.customColors.greyTextColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Gap(16.h),
        Divider(
          color: Get.theme.customColors.bgColor,
        ),
        Row(
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                  color: Get.theme.customColors.bgColor,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: CustomImageView(
                  imagePath: AssetConstants.icWarning,
                ),
              ),
            ),
            Gap(10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.T.lbl_inconsistency_flags,
                    style: Get.theme.textTheme.bodySmall!.copyWith(
                      color: Get.theme.customColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(2.h),
                  Text(
                    AppStrings.T.lbl_inconsistency_flags_description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Get.theme.textTheme.bodySmall!.copyWith(
                      color: Get.theme.customColors.greyTextColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Gap(40.h),
        Container(
          height: 73.h,
          decoration: BoxDecoration(
            color: Get.theme.customColors.primaryColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.T.lbl_basic_analysis_package,
                  overflow: TextOverflow.ellipsis,
                  style: Get.theme.textTheme.bodySmall!.copyWith(
                    color: Get.theme.customColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${20}',
                  overflow: TextOverflow.ellipsis,
                  style: Get.theme.textTheme.bodySmall!.copyWith(
                    color: Get.theme.customColors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomElevatedButton(
        text: AppStrings.T.lbl_pay_and_get_results,
        onPressed: () {},
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
