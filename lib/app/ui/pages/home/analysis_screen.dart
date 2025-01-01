import 'package:mymanislier/app/utils/helpers/exporter.dart';

class AnalysisScreen extends GetItHook<HomeController> {
  AnalysisScreen({super.key});

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
        AppStrings.T.lbl_analysis,
        style: Get.theme.textTheme.bodyLarge!.copyWith(
          color: Get.theme.customColors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Row(
          children: [
            CircleAvatar(
              radius: 23.r,
              backgroundColor: Get.theme.customColors.appBarIcBg,
              child: CustomImageView(
                imagePath: AssetConstants.icShare,
              ),
            ),
            Gap(10.w),
            CircleAvatar(
              radius: 23.r,
              backgroundColor: Get.theme.customColors.appBarIcBg,
              child: CustomImageView(
                imagePath: AssetConstants.icDownload,
              ),
            ),
          ],
        )
      ],
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
            _buildOverallSummary(),
            Gap(20.h),
            _buildDivider(),
            Gap(20.h),
            _buildDetialInsights(),
            Gap(20.h),
            _buildSentimentAnalysis(),
            Gap(20.h),
            _buildInconsistencyFlags(),
            Gap(20.h),
            _buildBehavioralPatterns(),
            Gap(30.h),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: CenterText(
        AppStrings.T.lbl_your_analysis_is_ready,
        style: Get.theme.textTheme.headlineMedium!.copyWith(
            color: Get.theme.customColors.white, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildOverallSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.T.lbl_overall_summary,
            style: Get.theme.textTheme.bodyMedium!.copyWith(
                color: Get.theme.customColors.white,
                fontWeight: FontWeight.w700)),
        Gap(2.h),
        ReadMoreText(
          'The conversation had a predominantly positive tone with occasional neutral exchanges. However, there were a few vague responses that may require clarification. A slight shift in communication style was observed, transitioning from casual to formal. Overall, no major red flags were detected, but it’s worth addressing specific areas of concern for better clarity.',
          // style: Get.theme.textTheme.labelSmall!.copyWith(
          //   color: Get.theme.customColors.greyTextColor,
          //   fontWeight: FontWeight.w500,
          // ),
          style: TextStyle(
            fontSize: 14.sp,
            color: Get.theme.customColors.greyTextColor,
            fontWeight: FontWeight.w500,
          ),
          moreStyle: Get.theme.textTheme.labelSmall!.copyWith(
            color: Get.theme.customColors.darkGrey,
            fontWeight: FontWeight.w500,
          ),
          lessStyle: Get.theme.textTheme.labelSmall!.copyWith(
            color: Get.theme.customColors.darkGrey,
            fontWeight: FontWeight.w500,
          ),
          trimLength: 100,
          trimMode: TrimMode.Length,
          delimiter: '',
          trimCollapsedText: ' more...',
          trimExpandedText: ' less.',
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return const CustomDivider();
  }

  Widget _buildDetialInsights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.T.lbl_detailed_insights,
            style: Get.theme.textTheme.bodyMedium!.copyWith(
                color: Get.theme.customColors.white,
                fontWeight: FontWeight.w700)),
        Gap(2.h),
        Text(AppStrings.T.lbl_detailed_insights_description,
            style: Get.theme.textTheme.labelSmall!.copyWith(
                color: Get.theme.customColors.greyTextColor,
                fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildSentimentAnalysis() {
    return AnalysisSection(
      title: AppStrings.T.lbl_sentiment_analysis,
      imagePath: AssetConstants.icPieChart,
      showChart: true,
    );
  }

  Widget _buildInconsistencyFlags() {
    return AnalysisSection(
      title: AppStrings.T.lbl_inconsistency_flags,
      imagePath: AssetConstants.icWarning,
      warningContent: const [
        'Line 32',
        'Line 45',
        'Line 23',
      ],
    );
  }

  Widget _buildBehavioralPatterns() {
    return AnalysisSection(
      title: AppStrings.T.lbl_behavioral_patterns,
      imagePath: AssetConstants.icSearch,
      patternContent: const [
        AnalysisPattern(
          title: 'Start: "Casual tone"',
          description:
              'Line 12: Shift from casual to neutral tone. Response lacks emotional context.',
          description2:
              'Line 18: Casual language replaced by short, factual replies.',
          type: PatternType.positive,
        ),
        AnalysisPattern(
          title: 'Middle: "Neutral responses"',
          description:
              'Line 25: Defensive tone detected. The response includes justification and over-explaining.',
          description2:
              'Line 28: A shift to formal tone with phrases like ‘I don’t think that’s correct.’',
          type: PatternType.neutral,
        ),
        AnalysisPattern(
          title: 'End: "Strong tone detected"',
          description:
              'Line 30: Shift from casual emojis to a formal, direct style.',
          description2:
              'Line 35: Tone becomes formal, with structured sentences and no contractions.',
          type: PatternType.negative,
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return CustomElevatedButton(
        text: AppStrings.T.lbl_go_to_new_analysis, onPressed: () {});
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {
    controller.resetValues();
  }

  @override
  void onInit() {}
}

class AnalysisSection extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool showChart;
  final List<String>? warningContent;
  final List<AnalysisPattern>? patternContent;

  const AnalysisSection({
    required this.title,
    required this.imagePath,
    this.showChart = false,
    this.warningContent,
    this.patternContent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          iconColor: Get.theme.customColors.greyTextColor,
          title: Row(
            children: [
              CustomImageView(
                imagePath: imagePath,
              ),
              Gap(12.w),
              Text(title,
                  style: Get.theme.textTheme.labelSmall!.copyWith(
                      color: Get.theme.customColors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          children: [
            if (showChart) const SentimentPieChart(),
            if (warningContent != null) ...[
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WarningItem(
                    text: 'Line 32',
                    text2: 'This seems unusually vague.',
                    text3: 'Conversation Text: "l was just busy with...stuff.',
                  ),
                  WarningItem(
                    text: 'Line 45',
                    text2: 'This seems unusually vague.',
                    text3: 'Conversation Text: "l was just busy with...stuff.',
                  ),
                  WarningItem(
                    text: 'Line 23',
                    text2: 'This seems unusually vague.',
                    text3: 'Conversation Text: "l was just busy with...stuff.',
                    showDivider: false,
                  ),
                ],
              ),
            ],
            if (patternContent != null) ...[
              for (var pattern in patternContent!)
                Column(
                  children: [
                    PatternItem(pattern: pattern),
                  ],
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class SentimentPieChart extends StatelessWidget {
  const SentimentPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.T.lbl_sentiment_analysis,
              style: Get.theme.textTheme.labelSmall!.copyWith(
                  color: Get.theme.customColors.greyTextColor,
                  fontWeight: FontWeight.w500)),
          Gap(6.h),
          Text('75% ${AppStrings.T.lbl_positive}',
              style: Get.theme.textTheme.bodyMedium!.copyWith(
                  color: Get.theme.customColors.white,
                  fontWeight: FontWeight.w700)),
          Gap(16.h),
          Container(
            decoration: BoxDecoration(
              color: Get.theme.customColors.greyContainerBg,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 32.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 170.h,
                    width: 170.w,
                    child: SfCircularChart(
                      legend: const Legend(
                        isVisible: false,
                        position: LegendPosition.bottom,
                      ),
                      series: <PieSeries<_ChartData, String>>[
                        PieSeries<_ChartData, String>(
                          dataSource: <_ChartData>[
                            _ChartData(
                                'Positive', 75, Get.theme.customColors.green!),
                            _ChartData(
                                'Neutral', 20, Get.theme.customColors.yellow!),
                            _ChartData(
                                'Negative', 5, Get.theme.customColors.orange!),
                          ],
                          xValueMapper: (_ChartData data, _) => data.label,
                          yValueMapper: (_ChartData data, _) => data.value,
                          pointColorMapper: (_ChartData data, _) => data.color,
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(20.w),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 12.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Get.theme.customColors.green,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                          ),
                          Gap(6.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.T.lbl_casual,
                                style: Get.theme.textTheme.labelSmall!.copyWith(
                                    color: Get.theme.customColors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '75%',
                                style: Get.theme.textTheme.labelSmall!.copyWith(
                                    color: Get.theme.customColors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                      Gap(19.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 12.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Get.theme.customColors.yellow,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                          ),
                          Gap(6.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.T.lbl_casual,
                                style: Get.theme.textTheme.labelSmall!.copyWith(
                                    color: Get.theme.customColors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '20%',
                                style: Get.theme.textTheme.labelSmall!.copyWith(
                                    color: Get.theme.customColors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      ),
                      Gap(19.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 12.h,
                            width: 12.w,
                            decoration: BoxDecoration(
                              color: Get.theme.customColors.orange,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                          ),
                          Gap(6.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.T.lbl_casual,
                                style: Get.theme.textTheme.labelSmall!.copyWith(
                                    color: Get.theme.customColors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                '5%',
                                style: Get.theme.textTheme.labelSmall!.copyWith(
                                    color: Get.theme.customColors.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  final String label;
  final double value;
  final Color color;

  _ChartData(this.label, this.value, this.color);
}

class WarningItem extends StatelessWidget {
  final String text;
  final String text2;
  final String text3;
  final bool showDivider;

  const WarningItem({
    required this.text,
    super.key,
    required this.text2,
    required this.text3,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                  color: Get.theme.customColors.greyContainerBg,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomImageView(
                    imagePath: AssetConstants.icWarning,
                  ),
                ),
              ),
              Gap(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: Get.theme.textTheme.labelSmall!.copyWith(
                          color: Get.theme.customColors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    Gap(2.h),
                    Text(
                      text2,
                      overflow: TextOverflow.ellipsis,
                      style: Get.theme.textTheme.labelSmall!.copyWith(
                          color: Get.theme.customColors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    Gap(2.h),
                    Text(
                      text3,
                      maxLines: 2,
                      style: Get.theme.textTheme.labelSmall!.copyWith(
                          color: Get.theme.customColors.greyTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (showDivider) ...[
            Gap(16.h),
            Divider(
              color: Get.theme.customColors.darkGreyBorder,
            ),
          ],
        ],
      ),
    );
  }
}

enum PatternType { positive, neutral, negative }

class AnalysisPattern {
  final String title;
  final String description;
  final String description2;
  final PatternType type;

  const AnalysisPattern({
    required this.title,
    required this.description,
    required this.description2,
    required this.type,
  });
}

class PatternItem extends StatelessWidget {
  final AnalysisPattern pattern;

  const PatternItem({required this.pattern, super.key});

  IconData get icon {
    switch (pattern.type) {
      case PatternType.positive:
        return Icons.check_circle;
      case PatternType.neutral:
        return Icons.remove_circle;
      case PatternType.negative:
        return Icons.cancel;
    }
  }

  Color get color {
    switch (pattern.type) {
      case PatternType.positive:
        return Colors.green;
      case PatternType.neutral:
        return Colors.orange;
      case PatternType.negative:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 16.h,
            height: 16.w,
            margin: EdgeInsets.only(top: 4.h),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          Gap(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pattern.title,
                  style: Get.theme.textTheme.labelSmall!.copyWith(
                      color: Get.theme.customColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                ),
                Gap(8.h),
                Text(
                  pattern.description,
                  style: Get.theme.textTheme.labelSmall!.copyWith(
                      color: Get.theme.customColors.greyTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp),
                ),
                Divider(
                  color: Get.theme.customColors.darkGreyBorder,
                ),
                Text(
                  pattern.description2,
                  style: Get.theme.textTheme.labelSmall!.copyWith(
                      color: Get.theme.customColors.greyTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp),
                ),
                Gap(8.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
