import 'package:mymanislier/app/utils/helpers/exporter.dart';

class DeleteAccountScreen extends GetItHook<SettingController> {
  DeleteAccountScreen({super.key});

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
        AppStrings.T.lbl_delete_account,
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
            _buildReasonWidget(),
            _buildDeleteAccountButton(),
            Gap(20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildReasonWidget() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSelectableReason(0, AppStrings.T.lbl_reason_1),
            _buildSelectableReason(1, AppStrings.T.lbl_reason_2),
            _buildSelectableReason(2, AppStrings.T.lbl_reason_3),
            _buildSelectableReason(3, AppStrings.T.lbl_reason_4),
            _buildSelectableReason(4, AppStrings.T.lbl_other),
            if (controller.selectedReasonIndex.value == 4) _buildReasonField(),
            Gap(30.h),
          ],
        ));
  }

  Widget _buildSelectableReason(int index, String reason) {
    return Obx(() {
      final isSelected = controller.selectedReasonIndex.value == index;
      return GestureDetector(
          onTap: () {
            controller.selectedReasonIndex.value = index;
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Container(
              height: 60.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: isSelected
                    ? Get.theme.customColors.white
                    : Get.theme.customColors.greyBg,
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(
                  color: Get.theme.customColors.darkGreyBorder!,
                  width: 1.w,
                ),
              ),
              child: Center(
                child: CenterText(
                  reason,
                  style: Get.theme.textTheme.labelSmall!.copyWith(
                    color: isSelected
                        ? Get.theme.customColors.black
                        : Get.theme.customColors.greyTextColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ));
    });
  }

  Widget _buildReasonField() {
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
      controller: controller.reasonController,
      hintLabel: AppStrings.T.lbl_enter_your_reason,
      validator: AppValidations.validateRequired,
    );
  }

  Widget _buildDeleteAccountButton() {
    return Obx(
      () {
        return CustomElevatedButton(
          isLoading: controller.deleteAccountState.isLoading,
          isDisabled: controller.deleteAccountState.isLoading,
          text: AppStrings.T.lbl_delete_account,
          onPressed: () {
            Get.focusScope!.unfocus();
            _showDeleteAccountDialog();
          },
        );
      },
    );
  }

  void _showDeleteAccountDialog() {
    Get.dialog(
      AlertDialog(
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
                  height: 50.h,
                  imagePath: AssetConstants.pngTrash,
                ),
              ),
              Gap(20.h),
              CenterText(
                AppStrings.T.lbl_delete_account,
                style: Get.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 26.sp,
                    color: Get.theme.customColors.white),
              ),
              Gap(20.h),
              CenterText(
                AppStrings.T.lbl_conformation_delete_account,
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
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    text: AppStrings.T.lbl_yes,
                    secondary: true,
                    buttonStyle:
                        ButtonThemeHelper.secondaryButtonStyle(Get.context!),
                    onPressed: () {
                      Get.focusScope!.unfocus();
                      Get.back;
                      controller.deleteAccount(Get.context!);
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
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}
