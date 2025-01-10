import 'package:mymanislier/app/utils/helpers/exporter.dart';

class SplashPage extends GetItHook<AppController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Get.theme.primaryColor,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: CustomImageView(
            imagePath: AssetConstants.svgSplash,
          ),
        ),
      ),
    );
  }

  @override
  bool get canDisposeController => true;

  @override
  void onDispose() {}

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.onSplash(Get.context ?? Get.context!);
    });
  }
}
