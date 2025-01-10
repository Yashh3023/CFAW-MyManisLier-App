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
  final RxInt currentIndex = 0.obs;
  final totalPages = 5;

  // Form Controllers
  final nameController = TextEditingController();
  final partnerNameController = TextEditingController();
  final pasteTextConversaionController = TextEditingController();
  final cardInptu = TextEditingController();

  // API State
  final uploadeState = ApiState.initial().obs;
  final questionState = ApiState.initial().obs;

  // Question Responses
  var selectedDuration = ''.obs;
  var concerns = <String>[].obs;
  var hasTrustIssues = false.obs;
  var hasChangedStyle = false.obs;
  var hasHappenedBefore = false.obs;

  var selectedPaymentOption = PaymentOption.card.obs;

  void changePage(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void upload(FormState? formState) {
    if (formState == null || !formState.validate()) {
      return;
    }
    Get.toNamed(AppRoutes.genericQuestionsScreen);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    partnerNameController.dispose();
    pasteTextConversaionController.dispose();
    super.dispose();
  }
}
