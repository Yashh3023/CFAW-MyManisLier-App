import 'package:mymanislier/app/utils/helpers/exporter.dart';

class GetStartedScreen extends GetItHook<AuthController> {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.customColors.black,
      body: _buildBody(),
      bottomNavigationBar: _buildButtons(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: AppBar().preferredSize.height),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildHeader(),
          _buildImageBg(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        CenterText(
          AppStrings.T.lbl_get_started,
          style: Get.theme.textTheme.headlineLarge!
              .copyWith(color: Get.theme.customColors.white),
        ),
        Gap(15.h),
        CenterText(
          AppStrings.T.lbl_get_started_subtitle,
          style: Get.theme.textTheme.labelMedium!.copyWith(
              color: Get.theme.customColors.grey,
              fontSize: 16.0.sp,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildImageBg() {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: CustomImageView(
        imagePath: AssetConstants.pngGetStartedBg,
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.sigin);
            },
            text: AppStrings.T.signin,
          ),
          Gap(15.h),
          CustomElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.signup);
            },
            buttonStyle: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              backgroundColor:
                  WidgetStatePropertyAll(Get.theme.customColors.greyBg),
            ),
            text: AppStrings.T.signup,
          ),
          Gap(15.h),
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
