import 'package:mymanislier/app/utils/helpers/exporter.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 2.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Color.fromRGBO(134, 135, 137, 0.2),
                  Color.fromRGBO(36, 37, 44, 0.2),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 2.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(134, 135, 137, 0.2),
                  Color.fromRGBO(36, 37, 44, 0.2),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
