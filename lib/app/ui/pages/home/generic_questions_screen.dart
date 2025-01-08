import 'package:mymanislier/app/controllers/generic_question_controller.dart';
import 'package:mymanislier/app/utils/helpers/exporter.dart';

class GenericQuestionsScreen extends GetItHook<GenericQuestionController> {
  GenericQuestionsScreen({super.key});

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
      backArroBgColor: Get.theme.customColors.appBarIcBg,
      title: Text(
        AppStrings.T.lbl_generic_questions,
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
                    text: '${controller.currentIndex.value + 1}',
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
                    text: '${controller.totalPages}',
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
              controller.totalPages,
              (index) => Obx(
                () => Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: (controller.currentIndex.value == index ||
                            controller.currentIndex.value == index - 1)
                        ? 5.h
                        : 5.h,
                    decoration: BoxDecoration(
                      color: (index <= controller.currentIndex.value)
                          ? Get.theme.customColors.primaryColor
                          : Get.theme.customColors.bgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular((index == 0) ? 20.r : 0.r),
                        bottomLeft: Radius.circular((index == 0) ? 20.r : 0.r),
                        topRight: Radius.circular(
                            (index == controller.totalPages - 1) ? 20.r : 0.r),
                        bottomRight: Radius.circular(
                            (index == controller.totalPages - 1) ? 20.r : 0.r),
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
        controller: controller.pageController,
        onPageChanged: (index) {
          controller.currentIndex.value = index;
        },
        children: pages,
      ),
    );
  }

  Widget _buildFirstQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CenterText(
          'How long have you been in this relationship?',
          style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Get.theme.customColors.white,
              ),
        ),
        Gap(20.h),
        ...['1 Year', '2 Years', '3 Years', '4+'].map(
          (duration) => Obx(
            () => Container(
              height: 60.h,
              margin: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: controller.selectedDuration.value == duration
                    ? Get.theme.customColors.white
                    : Get.theme.customColors.bgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: duration,
                    groupValue: controller.selectedDuration.value,
                    activeColor: Get.theme.customColors.black,
                    onChanged: (value) {
                      controller.selectedDuration.value = value!;
                    },
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.selectedDuration.value = duration;
                      },
                      child: Text(
                        duration,
                        style: Theme.of(Get.context!)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                              color:
                                  controller.selectedDuration.value == duration
                                      ? Get.theme.customColors.bgColor
                                      : Get.theme.customColors.white,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSecondQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CenterText(
          'What concerns do you have about this conversation?',
          style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Get.theme.customColors.white,
              ),
        ),
        Gap(20.h),
        ...['Cheating', 'Lying', 'Inconsistency', 'Loss of Interest'].map(
          (concern) => Obx(
            () => GestureDetector(
              onTap: () {
                if (controller.concerns.contains(concern)) {
                  controller.concerns.remove(concern);
                } else {
                  controller.concerns.add(concern);
                }
              },
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: controller.concerns.contains(concern)
                      ? Get.theme.customColors.white
                      : Get.theme.customColors.bgColor,
                ),
                margin: EdgeInsets.symmetric(vertical: 8.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          value: controller.concerns.contains(concern),
                          onChanged: (checked) {
                            if (checked!) {
                              controller.concerns.add(concern);
                            } else {
                              controller.concerns.remove(concern);
                            }
                          },
                          checkColor: Get.theme.customColors.white,
                          activeColor: Get.theme.customColors.black,
                        ),
                      ),
                      Gap(12.w),
                      Expanded(
                        child: Text(
                          concern,
                          style: Get.textTheme.bodySmall?.copyWith(
                            color: controller.concerns.contains(concern)
                                ? Get.theme.customColors.bgColor
                                : Get.theme.customColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThirdQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CenterText(
          'What is the tone of the conversation?',
          style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: Get.theme.customColors.white,
              ),
        ),
        Gap(20.h),
        ...['Casual', 'Argumentative', 'Serious', 'Angry'].map(
          (duration) => Obx(
            () => Container(
              height: 60.h,
              margin: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: controller.selectedDuration.value == duration
                    ? Get.theme.customColors.white
                    : Get.theme.customColors.bgColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: duration,
                    groupValue: controller.selectedDuration.value,
                    activeColor: Get.theme.customColors.black,
                    onChanged: (value) {
                      controller.selectedDuration.value = value!;
                    },
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.selectedDuration.value = duration;
                      },
                      child: Text(
                        duration,
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: controller.selectedDuration.value == duration
                              ? Get.theme.customColors.bgColor
                              : Get.theme.customColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFourthQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CenterText(
          'Any major trust issues in the past?',
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
                    groupValue: controller.hasTrustIssues.value,
                    onChanged: (value) =>
                        controller.hasTrustIssues.value = value!,
                    title: Text(
                      AppStrings.T.lbl_yes,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.hasTrustIssues.value
                            ? Get.theme.customColors.black
                            : Get.theme.customColors.white,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.hasTrustIssues.value
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
                    groupValue: controller.hasTrustIssues.value,
                    onChanged: (value) =>
                        controller.hasTrustIssues.value = value!,
                    title: Text(
                      AppStrings.T.lbl_no,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.hasTrustIssues.value
                            ? Get.theme.customColors.white
                            : Get.theme.customColors.black,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.hasTrustIssues.value
                        ? Get.theme.customColors.black
                        : Get.theme.customColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ],
            )),
        Gap(40.h),
        Text(
          'Have you noticed any changes in his communication style?',
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
                    groupValue: controller.hasChangedStyle.value,
                    onChanged: (value) =>
                        controller.hasChangedStyle.value = value!,
                    title: Text(
                      AppStrings.T.lbl_yes,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.hasChangedStyle.value
                            ? Get.theme.customColors.black
                            : Get.theme.customColors.white,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.hasChangedStyle.value
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
                    groupValue: controller.hasChangedStyle.value,
                    onChanged: (value) =>
                        controller.hasChangedStyle.value = value!,
                    title: Text(
                      AppStrings.T.lbl_no,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.hasChangedStyle.value
                            ? Get.theme.customColors.white
                            : Get.theme.customColors.black,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.hasChangedStyle.value
                        ? Get.theme.customColors.black
                        : Get.theme.customColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ],
            )),
        Gap(40.h),
      ],
    );
  }

  Widget _buildFifthQuestion() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CenterText(
          'Has this happened before?',
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
                    groupValue: controller.hasHappenedBefore.value,
                    onChanged: (value) =>
                        controller.hasHappenedBefore.value = value!,
                    title: Text(
                      AppStrings.T.lbl_yes,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.hasHappenedBefore.value
                            ? Get.theme.customColors.black
                            : Get.theme.customColors.white,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.hasHappenedBefore.value
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
                    groupValue: controller.hasHappenedBefore.value,
                    onChanged: (value) =>
                        controller.hasHappenedBefore.value = value!,
                    title: Text(
                      AppStrings.T.lbl_no,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                        color: controller.hasHappenedBefore.value
                            ? Get.theme.customColors.white
                            : Get.theme.customColors.black,
                      ),
                    ),
                    activeColor: Get.theme.customColors.black,
                    tileColor: controller.hasHappenedBefore.value
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
          Obx(
            () {
              if (controller.currentIndex.value != 0) {
                return Expanded(
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
                      if (controller.currentIndex.value > 0) {
                        controller
                            .changePage(controller.currentIndex.value - 1);
                      }
                    },
                  ),
                );
              } else {
                return const Expanded(flex: 2, child: SizedBox());
              }
            },
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
                  text:
                      controller.currentIndex.value == controller.totalPages - 1
                          ? AppStrings.T.lbl_finish
                          : AppStrings.T.lbl_next,
                  onPressed: () {
                    if (controller.currentIndex.value < pages.length - 1) {
                      controller.changePage(controller.currentIndex.value + 1);
                    } else {
                      Get.toNamed(AppRoutes.unlockAnalysisScreen);
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
    controller.currentIndex.value = 0;
    pages = [
      _buildFirstQuestion(),
      _buildSecondQuestion(),
      _buildThirdQuestion(),
      _buildFourthQuestion(),
      _buildFifthQuestion(),
    ];
  }
}
