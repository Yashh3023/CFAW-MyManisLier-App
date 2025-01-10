import 'package:injectable/injectable.dart' as i;
import 'package:mymanislier/app/utils/helpers/exporter.dart';

@i.lazySingleton
@i.injectable
class ChatbasedController extends GetxController {
  ChatbasedController() {
    onInit();
  }

  var chatPageController = PageController();
  final RxInt chatCurrentIndex = 0.obs;
  final chatTotalPages = 4;

  final responseController = TextEditingController();

  // API State
  final uploadeState = ApiState.initial().obs;
  final questionState = ApiState.initial().obs;

  // Question Responses
  var selectedDuration = ''.obs;
  var concerns = <String>[].obs;
  var selectedTone = ''.obs;
  var hasTrustIssues = false.obs;
  var hasChangedStyle = false.obs;
  var hasHappenedBefore = false.obs;

  var showAllText = false;

  var trustMe = false.obs;
  var avoidAnswer = false.obs;
  var youOverThinking = false.obs;

  void chatChangePage(int index) {
    chatCurrentIndex.value = index;
    chatPageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void chatResetValues() {
    chatCurrentIndex.value = 0;
    trustMe.value = false;
    avoidAnswer.value = false;
    youOverThinking.value = false;

    if (chatPageController.hasClients) {
      chatPageController.jumpToPage(0);
    }
  }

  void upload(FormState? formState) {
    if (formState == null || !formState.validate()) {
      return;
    }
    Get.toNamed(AppRoutes.genericQuestionsScreen);
  }

  @override
  void onInit() {
    super.onInit();
    chatPageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    responseController.dispose();
    super.dispose();
  }
}
