import 'package:mymanislier/app/utils/helpers/exporter.dart';

class ButtonThemeHelper {
  // Primary Button Theme
  static ButtonStyle primaryButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.r),
      ),
      padding: EdgeInsets.zero,
      textStyle: Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18.0.sp),
    );
  }

  // Secondary Button Theme
  static ButtonStyle secondaryButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.r),
        side: BorderSide(
          color: Get.theme.customColors.secondarybtn!,
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.zero,
      elevation: 0,
      backgroundColor: Get.theme.customColors.black,
    );
  }
}
