import 'package:injectable/injectable.dart' as i;
import 'package:mymanislier/app/utils/helpers/exporter.dart';

@i.lazySingleton
@i.injectable
class GenericQuestionController extends GetxController {
  GenericQuestionController() {
    onInit();
  }

  // Page Control
  var pageController = PageController();
  final RxInt currentIndex = 0.obs;
  final totalPages = 5;

  // API State
  final uploadeState = ApiState.initial().obs;
  final questionState = ApiState.initial().obs;

  // Question Responses
  var selectedDuration = ''.obs;
  var concerns = <String>[].obs;
  var hasTrustIssues = false.obs;
  var hasChangedStyle = false.obs;
  var hasHappenedBefore = false.obs;

  void changePage(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }
}
