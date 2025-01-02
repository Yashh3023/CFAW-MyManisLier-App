import 'package:mymanislier/app/utils/helpers/exporter.dart';

class FaqScreen extends StatelessWidget {
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

    return Scaffold(
      backgroundColor: Get.theme.customColors.black,
      appBar: _buildAppBar(),
      body: _buildBody(faqItems),
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

  Widget _buildBody(List<FaqItem> faqItems) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: faqItems.map((item) => FaqTile(item: item)).toList(),
        ),
      ),
    );
  }
}

class FaqTile extends StatelessWidget {
  final FaqItem item;

  const FaqTile({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Get.theme.customColors.textfieldFillColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border(
          left: BorderSide(
              color: Get.theme.customColors.secondaryColor!, width: 4.0.w),
        ),
      ),
      child: Theme(
        data: Theme.of(Get.context!).copyWith(dividerColor: Colors.transparent),
        child: CustomExpansionTile(title: item.question, content: item.answer),
      ),
    );
  }
}

class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}
