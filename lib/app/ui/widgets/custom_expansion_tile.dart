import 'package:mymanislier/app/utils/helpers/exporter.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String content;

  const CustomExpansionTile({
    required this.title,
    required this.content,
    super.key,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, top: 15.h, bottom: 15.h, right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: Get.theme.textTheme.labelSmall!.copyWith(
                      color: Get.theme.customColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                CustomImageView(
                    height: 18.0.h,
                    imagePath: isExpanded
                        ? AssetConstants.icArrowUp
                        : AssetConstants.icArrowDown)
              ],
            ),
          ),
          Gap(8.h),
          if (isExpanded)
            Text(
              widget.content,
              style: Get.theme.textTheme.labelSmall!.copyWith(
                color: Get.theme.customColors.greyTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }
}
