import 'dart:io';
import 'package:mymanislier/app/utils/helpers/exporter.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key,
      this.title,
      this.hasLeadingIcon = true,
      this.actions,
      this.onLeadingTap,
      this.appbarBgColor,
      this.backArroBgColor});
  final Widget? title;
  final bool hasLeadingIcon;
  final List<Widget>? actions;
  final VoidCallback? onLeadingTap;
  final Color? appbarBgColor;
  final Color? backArroBgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appbarBgColor ?? Get.theme.customColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.only(
          top: Platform.isIOS ? 55.0 : 40.0,
          right: 20,
          left: 20,
          bottom: 8,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (hasLeadingIcon)
              Row(
                children: [
                  InkWell(
                    onTap: onLeadingTap ??
                        () {
                          Get.back();
                          FocusScope.of(context).unfocus();
                        },
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor:
                          backArroBgColor ?? Get.theme.customColors.greyBg,
                      child: CustomImageView(
                        imagePath: AssetConstants.icAppbarBack,
                      ),
                    ),
                  ),
                ],
              ),
            Align(
                alignment:
                    hasLeadingIcon ? Alignment.center : Alignment.centerLeft,
                child: title),
            if (actions != null)
              Positioned(
                right: 0,
                child: Row(children: actions!),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 25);
}
