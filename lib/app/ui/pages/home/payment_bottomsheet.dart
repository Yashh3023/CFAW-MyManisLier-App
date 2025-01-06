import 'dart:ui';

import 'package:mymanislier/app/utils/constants/enum.dart';
import 'package:mymanislier/app/utils/helpers/exporter.dart';

class PaymentBottomSheet extends GetItHook<HomeController> {
  const PaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPaymentOptions(),
          Gap(20.h),
          _buildSecureCheckoutText(),
          Gap(20.h),
          _buildCardInputFields(),
          Gap(15.h),
          _buildExpirationAndCVCFields(),
          Gap(15.h),
          _buildCountryDropdown(),
          Gap(20.h),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            flex: 2,
            child: _PaymentOption(
              imagePath: AssetConstants.icBasicCard,
              label: 'Card',
              isSelected:
                  controller.selectedPaymentOption.value == PaymentOption.card,
              onTap: () =>
                  controller.selectedPaymentOption.value = PaymentOption.card,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 2,
            child: _PaymentOption(
              imagePath: AssetConstants.icPaypal,
              label: 'PayPal',
              isSelected: controller.selectedPaymentOption.value ==
                  PaymentOption.paypal,
              onTap: () =>
                  controller.selectedPaymentOption.value = PaymentOption.paypal,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 2,
            child: _PaymentOption(
              imagePath: AssetConstants.pngEsp,
              label: 'EPS',
              isSelected:
                  controller.selectedPaymentOption.value == PaymentOption.eps,
              onTap: () =>
                  controller.selectedPaymentOption.value = PaymentOption.eps,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 2,
            child: _PaymentOption(
              imagePath: AssetConstants.pngP24,
              label: 'Przelewy24',
              isSelected: controller.selectedPaymentOption.value ==
                  PaymentOption.przelewy24,
              onTap: () => controller.selectedPaymentOption.value =
                  PaymentOption.przelewy24,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 1,
            child: Center(
              child: _PaymentOption(
                imagePath: AssetConstants.pngGp,
                isSelected: controller.selectedPaymentOption.value ==
                    PaymentOption.gpay,
                onTap: () =>
                    controller.selectedPaymentOption.value = PaymentOption.gpay,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecureCheckoutText() {
    return Row(
      children: [
        CustomImageView(
          height: 19.h,
          imagePath: AssetConstants.icLockGreen,
        ),
        Gap(5.w),
        Text(AppStrings.T.lbl_secure_link,
            style: Get.theme.textTheme.labelMedium!
                .copyWith(color: Get.theme.customColors.blueText)),
        Gap(8.w),
        CustomImageView(
          height: 12.h,
          width: 12.w,
          imagePath: AssetConstants.icDropdown,
          color: Get.theme.customColors.blueText,
        ),
      ],
    );
  }

  Widget _buildCardInputFields() {
    return Container(
      height: 65.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Get.theme.customColors.greyBorder!,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.T.lbl_card_number,
                    style: Get.theme.textTheme.labelSmall!
                        .copyWith(color: Get.theme.customColors.black)),
                Text('1234 1234 1234 1234',
                    style: Get.theme.textTheme.labelSmall!
                        .copyWith(color: Get.theme.customColors.greyTextColor)),
              ],
            ),
            Row(
              children: [
                CustomImageView(
                  height: 19.h,
                  imagePath: AssetConstants.icVisaCard,
                ),
                Gap(2.w),
                CustomImageView(
                  height: 19.h,
                  imagePath: AssetConstants.icMasterCard,
                ),
                Gap(2.w),
                CustomImageView(
                  height: 19.h,
                  imagePath: AssetConstants.icAmexCard,
                ),
                Gap(2.w),
                CustomImageView(
                  height: 19.h,
                  imagePath: AssetConstants.icDiscoverCard,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpirationAndCVCFields() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 65.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: Get.theme.customColors.greyBorder!,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.T.lbl_expiration,
                      style: Get.theme.textTheme.labelSmall!
                          .copyWith(color: Get.theme.customColors.black)),
                  Text('MM/YY',
                      style: Get.theme.textTheme.labelSmall!.copyWith(
                          color: Get.theme.customColors.greyTextColor)),
                ],
              ),
            ),
          ),
        ),
        Gap(16.w),
        Expanded(
          child: Container(
            height: 65.h,
            decoration: BoxDecoration(
              border: Border.all(
                color: Get.theme.customColors.greyBorder!,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.T.lbl_cvc,
                          style: Get.theme.textTheme.labelSmall!
                              .copyWith(color: Get.theme.customColors.black)),
                      Text('XXX',
                          style: Get.theme.textTheme.labelSmall!.copyWith(
                              color: Get.theme.customColors.greyTextColor)),
                    ],
                  ),
                  CustomImageView(
                    height: 22.h,
                    imagePath: AssetConstants.icCardSlider,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCountryDropdown() {
    return Container(
      height: 65.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Get.theme.customColors.greyBorder!,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.T.lbl_country,
                    style: Get.theme.textTheme.labelSmall!
                        .copyWith(color: Get.theme.customColors.black)),
                Text('France',
                    style: Get.theme.textTheme.labelSmall!
                        .copyWith(color: Get.theme.customColors.greyTextColor)),
              ],
            ),
            CustomImageView(
              height: 20.h,
              width: 20.w,
              imagePath: AssetConstants.icDropdown,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return CustomElevatedButton(
      text: "${AppStrings.T.lbl_pay_now} \$20",
      onPressed: () {
        Get.back();
        _showAlertSuccessfulDialog(Get.context!);
      },
    );
  }

  void _showAlertSuccessfulDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Center(
              child: AlertDialog(
                backgroundColor: Get.theme.customColors.greyBg,
                title: Column(
                  children: [
                    CustomImageView(
                      imagePath: AssetConstants.svgCongratulation,
                    ),
                    Gap(20.h),
                    CenterText(
                      AppStrings.T.lbl_thanks,
                      style: Get.theme.textTheme.headlineLarge!
                          .copyWith(color: Get.theme.customColors.white),
                    ),
                    Gap(14.h),
                    CenterText(
                      AppStrings.T.lbl_payment_successful_message,
                      style: Get.theme.textTheme.bodySmall!.copyWith(
                          color: Get.theme.customColors.greyTextColor),
                    ),
                    Gap(30.h),
                    CustomElevatedButton(
                      text: AppStrings.T.lbl_close,
                      onPressed: () {
                        Get.back();
                        Get.toNamed(AppRoutes.welcomeHomeScreen);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  bool get canDisposeController => true;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}

class _PaymentOption extends GetItHook<HomeController> {
  final String imagePath;
  final String? label;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentOption({
    required this.imagePath,
    this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 51.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: Get.theme.customColors.greyBorder!,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(9.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomImageView(
                  height: 15.h,
                  imagePath: imagePath,
                ),
                if (label != null)
                  Expanded(
                    child: Text(
                      label!,
                      style: Get.theme.textTheme.labelSmall?.copyWith(
                          fontSize: 12.sp,
                          color: isSelected
                              ? Get.theme.customColors.blue
                              : Get.theme.customColors.greyTextColor),
                    ),
                  )
                else
                  Center(
                    child: CustomImageView(
                      height: 9.h,
                      width: 9.w,
                      imagePath: AssetConstants.icDropdown,
                      color: isSelected
                          ? Get.theme.customColors.blue
                          : Get.theme.customColors.greyTextColor,
                    ),
                  ),
              ],
            ),
          ),
        ));
  }

  @override
  bool get canDisposeController => false;

  @override
  void onDispose() {}

  @override
  void onInit() {}
}
