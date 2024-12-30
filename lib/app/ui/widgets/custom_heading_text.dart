import 'package:mymanislier/app/utils/helpers/exporter.dart';

class CustomHeadingText extends StatelessWidget {
  const CustomHeadingText({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Get.theme.textTheme.bodyLarge!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
