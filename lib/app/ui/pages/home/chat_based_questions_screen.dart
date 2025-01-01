import 'package:mymanislier/app/utils/helpers/exporter.dart';

class ChatBasedQuestionsScreen extends GetItHook<HomeController> {
  ChatBasedQuestionsScreen({super.key});

  late final List<Widget> pages;

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
      onLeadingTap: () {
        Get.back();
        controller.chatResetValues();
      },
      backArroBgColor: Get.theme.customColors.appBarIcBg,
      title: Text(
        AppStrings.T.lbl_chat_based_questions,
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
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      child: Column(
        children: [
          _buildProgressBar(),
          Gap(40.h),
          _buildQuestionPageView(),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${controller.chatCurrentIndex.value + 1}',
                    style: Theme.of(Get.context!)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Get.theme.customColors.white),
                  ),
                  TextSpan(
                    text: '/',
                    style: Theme.of(Get.context!)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Get.theme.customColors.white),
                  ),
                  TextSpan(
                    text: '${controller.chatTotalPages}',
                    style: Theme.of(Get.context!)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Get.theme.customColors.greyTextColor),
                  ),
                ],
              ),
            )),
        Gap(3.h),
        Container(
          decoration: BoxDecoration(
            color: Get.theme.customColors.greyTextColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: List.generate(
              controller.chatTotalPages,
              (index) => Obx(
                () => Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: (controller.chatCurrentIndex.value == index ||
                            controller.chatCurrentIndex.value == index - 1)
                        ? 5.h
                        : 5.h,
                    decoration: BoxDecoration(
                      color: (index <= controller.chatCurrentIndex.value)
                          ? Get.theme.customColors.primaryColor
                          : Get.theme.customColors.bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular((index == 0) ? 20.r : 0.r),
                        bottomLeft: Radius.circular((index == 0) ? 20.r : 0.r),
                        topRight: Radius.circular(
                            (index == controller.chatTotalPages - 1)
                                ? 20.r
                                : 0.r),
                        bottomRight: Radius.circular(
                            (index == controller.chatTotalPages - 1)
                                ? 20.r
                                : 0.r),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionPageView() {
    return Expanded(
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.chatPageController,
        onPageChanged: (index) {
          controller.chatCurrentIndex.value = index;
        },
        children: pages,
      ),
    );
  }

  Widget _buildFirstQuestion() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CenterText(
            'Your boyfriend mentioned two conflicting times here. Do you recall what actually happened on those days?',
            style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Get.theme.customColors.white),
          ),
          Gap(40.h),
          _buildTextconversationField()
        ],
      ),
    );
  }

  Widget _buildTextconversationField() {
    return TextInputField(
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
                margin: EdgeInsets.symmetric(horizontal: 16.w),
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
      controller: controller.responseController,
      hintLabel: AppStrings.T.lbl_enter_your_response,
    );
  }

  Widget _buildSecondQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CenterText(
          'He used the phrase ‘trust me’ three times. Has he said this in similar situations before?',
          style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600, color: Get.theme.customColors.white),
        ),
        Gap(40.h),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    value: true,
                    visualDensity: const VisualDensity(
                        vertical: VisualDensity.maximumDensity),
                    groupValue: controller.trustMe.value,
                    onChanged: (value) => controller.trustMe.value = value!,
                    title: Text(
                      AppStrings.T.lbl_yes,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.trustMe.value
                            ? Get.theme.customColors.black
                            : Get.theme.customColors.white,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.trustMe.value
                        ? Get.theme.customColors.white
                        : Get.theme.customColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                Gap(15.w),
                Expanded(
                  child: RadioListTile<bool>(
                    value: false,
                    visualDensity: const VisualDensity(
                        vertical: VisualDensity.maximumDensity),
                    groupValue: controller.trustMe.value,
                    onChanged: (value) => controller.trustMe.value = value!,
                    title: Text(
                      AppStrings.T.lbl_no,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.trustMe.value
                            ? Get.theme.customColors.white
                            : Get.theme.customColors.black,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.trustMe.value
                        ? Get.theme.customColors.black
                        : Get.theme.customColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildThirdQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CenterText(
          'He avoided answering directly about love is this something he often avoids?',
          style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600, color: Get.theme.customColors.white),
        ),
        Gap(40.h),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    value: true,
                    visualDensity: const VisualDensity(
                        vertical: VisualDensity.maximumDensity),
                    groupValue: controller.avoidAnswer.value,
                    onChanged: (value) => controller.avoidAnswer.value = value!,
                    title: Text(
                      AppStrings.T.lbl_yes,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.avoidAnswer.value
                            ? Get.theme.customColors.black
                            : Get.theme.customColors.white,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.avoidAnswer.value
                        ? Get.theme.customColors.white
                        : Get.theme.customColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                Gap(15.w),
                Expanded(
                  child: RadioListTile<bool>(
                    value: false,
                    visualDensity: const VisualDensity(
                        vertical: VisualDensity.maximumDensity),
                    groupValue: controller.avoidAnswer.value,
                    onChanged: (value) => controller.avoidAnswer.value = value!,
                    title: Text(
                      AppStrings.T.lbl_no,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.avoidAnswer.value
                            ? Get.theme.customColors.white
                            : Get.theme.customColors.black,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.avoidAnswer.value
                        ? Get.theme.customColors.black
                        : Get.theme.customColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildFourthQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CenterText(
          'Has he said \'trust me\' or \'you’re overthinking\' like this before',
          style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600, color: Get.theme.customColors.white),
        ),
        Gap(40.h),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    value: true,
                    visualDensity: const VisualDensity(
                        vertical: VisualDensity.maximumDensity),
                    groupValue: controller.youOverThinking.value,
                    onChanged: (value) =>
                        controller.youOverThinking.value = value!,
                    title: Text(
                      AppStrings.T.lbl_yes,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.youOverThinking.value
                            ? Get.theme.customColors.black
                            : Get.theme.customColors.white,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.youOverThinking.value
                        ? Get.theme.customColors.white
                        : Get.theme.customColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
                Gap(15.w),
                Expanded(
                  child: RadioListTile<bool>(
                    value: false,
                    visualDensity: const VisualDensity(
                        vertical: VisualDensity.maximumDensity),
                    groupValue: controller.youOverThinking.value,
                    onChanged: (value) =>
                        controller.youOverThinking.value = value!,
                    title: Text(
                      AppStrings.T.lbl_no,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.youOverThinking.value
                            ? Get.theme.customColors.white
                            : Get.theme.customColors.black,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.youOverThinking.value
                        ? Get.theme.customColors.black
                        : Get.theme.customColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: CustomElevatedButton(
              buttonStyle: ElevatedButton.styleFrom(
                backgroundColor: Get.theme.customColors.bgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
                padding: EdgeInsets.zero,
                textStyle: Theme.of(Get.context!)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              text: AppStrings.T.lbl_previous,
              onPressed: () {
                if (controller.chatCurrentIndex.value > 0) {
                  controller
                      .chatChangePage(controller.chatCurrentIndex.value - 1);
                }
              },
            ),
          ),
          Expanded(child: Gap(20.w)),
          Expanded(
              flex: 2,
              child: Obx(
                () => CustomElevatedButton(
                  isLoading: controller.questionState.isLoading,
                  isDisabled: controller.questionState.isLoading,
                  rightIcon: CustomImageView(
                    imagePath: AssetConstants.icArrowRight,
                  ),
                  iconSpacing: 10.w,
                  text: controller.chatCurrentIndex.value ==
                          controller.chatTotalPages - 1
                      ? AppStrings.T.lbl_analyze
                      : AppStrings.T.lbl_next,
                  onPressed: () {
                    if (controller.chatCurrentIndex.value < pages.length - 1) {
                      controller.chatChangePage(
                          controller.chatCurrentIndex.value + 1);
                    } else {
                      Get.toNamed(AppRoutes.analysisScreen);
                    }
                  },
                ),
              )),
        ],
      ),
    );
  }

  @override
  bool get canDisposeController => true;

  @override
  void onDispose() {}

  @override
  void onInit() {
    controller.chatCurrentIndex.value = 0;
    pages = [
      _buildFirstQuestion(),
      _buildSecondQuestion(),
      _buildThirdQuestion(),
      _buildFourthQuestion(),
    ];
  }
}
