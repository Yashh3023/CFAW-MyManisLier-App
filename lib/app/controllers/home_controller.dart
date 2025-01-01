import 'package:injectable/injectable.dart' as i;
import 'package:mymanislier/app/utils/constants/enum.dart';
import 'package:mymanislier/app/utils/helpers/exporter.dart';

@i.lazySingleton
@i.injectable
class HomeController extends GetxController {
  HomeController() {
    onInit();
  }

  // Page Control
  var pageController = PageController();
  var chatPageController = PageController();
  final RxInt currentIndex = 0.obs;
  final RxInt chatCurrentIndex = 0.obs;
  final totalPages = 5;
  final chatTotalPages = 4;

  // Form Controllers
  final nameController = TextEditingController();
  final partnerNameController = TextEditingController();
  final pasteTextConversaionController = TextEditingController();
  final responseController = TextEditingController();
  final cardInptu = TextEditingController();

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

  var selectedPaymentOption = PaymentOption.card.obs;

  var showAllText = false;

  var trustMe = false.obs;
  var avoidAnswer = false.obs;
  var youOverThinking = false.obs;

  void changePage(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Reset all values to default
  void resetValues() {
    currentIndex.value = 0;
    selectedDuration.value = '';
    concerns.clear();
    selectedTone.value = '';
    hasTrustIssues.value = false;
    hasChangedStyle.value = false;
    hasHappenedBefore.value = false;
    nameController.clear();
    partnerNameController.clear();
    pasteTextConversaionController.clear();

    // Reset page to first position
    if (chatPageController.hasClients) {
      chatPageController.jumpToPage(0);
    }
  }

  void chatChangePage(int index) {
    chatCurrentIndex.value = index;
    chatPageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Reset all values to default
  void chatResetValues() {
    chatCurrentIndex.value = 0;
    trustMe.value = false;
    avoidAnswer.value = false;
    youOverThinking.value = false;

    // Reset page to first position
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
    pageController = PageController(initialPage: 0);
    chatPageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    nameController.dispose();
    partnerNameController.dispose();
    pasteTextConversaionController.dispose();
    super.dispose();
  }
}