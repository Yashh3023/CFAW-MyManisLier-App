import 'package:mymanislier/app/utils/helpers/exporter.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final String content;
  final bool isExpanded; 
  final ValueChanged<bool>? onExpansionChanged;

  const CustomExpansionTile({
    required this.title,
    required this.content,
    this.isExpanded = false, 
    this.onExpansionChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (onExpansionChanged != null) {
                onExpansionChanged!(!isExpanded);
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Get.theme.textTheme.labelSmall!.copyWith(
                      color: Get.theme.customColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(isExpanded ? 0.5 : 0.0),
                  child: CustomImageView(
                    height: 18.0.h,
                    imagePath: AssetConstants.icArrowDown,
                  ),
                ),
              ],
            ),
          ),
          Gap(8.h),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            firstChild: const SizedBox.shrink(),
            secondChild: Text(
              content,
              style: Get.theme.textTheme.labelSmall!.copyWith(
                color: Get.theme.customColors.greyTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ],
      ),
    );
  }
}
