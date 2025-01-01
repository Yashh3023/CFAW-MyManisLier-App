import 'package:mymanislier/app/utils/helpers/exporter.dart';

class CustomIconTextCardRow extends StatelessWidget {
  const CustomIconTextCardRow({
    this.imagePath,
    required this.text,
    this.onTap,
    this.color = Colors.white,
    this.height = 56,
    this.width = double.infinity,
    this.isCard = true,
    super.key, required Border border,
  });

  final String? imagePath;
  final String text;
  final VoidCallback? onTap;
  final Color color;
  final double height;
  final double width;
  final bool isCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: isCard
            ? Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Get.theme.customColors.textfieldFillColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: imagePath == null
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      if (imagePath != null)
                        Container(
                          decoration: BoxDecoration(
                            color: Get.theme.customColors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: CustomImageView(imagePath: imagePath),
                          ),
                        ),
                      if (imagePath != null) const Gap(8),
                      Text(
                        text,
                        style: Get.theme.textTheme.bodySmall!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: imagePath == null
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      if (imagePath != null)
                        CustomImageView(imagePath: imagePath),
                      if (imagePath != null) const Gap(8),
                      Text(
                        text,
                        style: Get.theme.textTheme.bodyLarge!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
