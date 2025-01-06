import 'package:mymanislier/app/utils/helpers/exporter.dart';

class FaqScreen extends GetItHook<SettingController> {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FaqItem> faqItems = [
      FaqItem(
        question:
            'Could you please assist me in setting up this text? Lorem Ipsum is simply dummy text?',
        answer:
            'Could you please assist me in setting up this text? Lorem Ipsum is simply dummy text?',
      ),
      FaqItem(
        question:
            'Could you please assist me in setting up this text? Lorem Ipsum is simply dummy text?',
        answer:
            'Could you please assist me in setting up this text? Lorem Ipsum is simply dummy text?',
      ),
      FaqItem(
        question:
            'Could you please assist me in setting up this text? Lorem Ipsum is simply dummy text?',
        answer:
            'Could you please assist me in setting up this text? Lorem Ipsum is simply dummy text?',
      ),
      FaqItem(
        question:
            'Could you please assist me in setting up this text? Lorem Ipsum is simply dummy text?',
        answer:
            'Could you please assist me in setting up this text? Lorem Ipsum is simply dummy text?',
      ),
    ];

    final ValueNotifier<int?> expandedTileIndexNotifier =
        ValueNotifier<int?>(null);

    return Scaffold(
      backgroundColor: Get.theme.customColors.black,
      appBar: _buildAppBar(),
      body: _buildBody(faqItems, expandedTileIndexNotifier),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppbar(
      hasLeadingIcon: true,
      backArroBgColor: Get.theme.customColors.appBarIcBg,
      title: Text(
        AppStrings.T.lbl_faq,
        style: Get.theme.textTheme.bodyLarge!.copyWith(
          color: Get.theme.customColors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildBody(
      List<FaqItem> faqItems, ValueNotifier<int?> expandedTileIndexNotifier) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: faqItems
              .asMap()
              .entries
              .map(
                (entry) => FaqTile(
                  item: entry.value,
                  index: entry.key,
                  expandedTileIndexNotifier: expandedTileIndexNotifier,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}

class FaqTile extends GetItHook<SettingController> {
  final FaqItem item;
  final int index;
  final ValueNotifier<int?> expandedTileIndexNotifier;

  const FaqTile({
    required this.item,
    required this.index,
    required this.expandedTileIndexNotifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: expandedTileIndexNotifier,
      builder: (context, expandedTileIndex, child) {
        final bool isOpen = expandedTileIndex == index;
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: Get.theme.customColors.textfieldFillColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border(
              left: BorderSide(
                color: isOpen
                    ? Get.theme.customColors.secondaryColor!
                    : Colors.grey,
                width: 4.0.w,
              ),
            ),
          ),
          child: Theme(
            data: Theme.of(Get.context!)
                .copyWith(dividerColor: Colors.transparent),
            child: CustomExpansionTile(
              title: item.question,
              content: item.answer,
              isExpanded: isOpen, 
              onExpansionChanged: (value) {
                if (value) {
                  expandedTileIndexNotifier.value = index; 
                } else if (expandedTileIndexNotifier.value == index) {
                  expandedTileIndexNotifier.value = null; 
                }
              },
            ),
          ),
        );
      },
    );
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}

class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}
