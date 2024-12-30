import 'package:mymanislier/app/utils/helpers/exporter.dart';

class _SuffixIcon extends StatelessWidget {
  const _SuffixIcon({
    required this.showing,
  });

  final RxBool showing;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        showing.value ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: showing.toggle,
    );
  }
}

class TextInputField extends TextFormField {
  TextInputField({
    super.key,
    required InputType type,
    required String hintLabel,
    required super.controller,
    super.textInputAction = TextInputAction.next,
    super.maxLines,
    super.minLines,
    super.autovalidateMode = AutovalidateMode.onUnfocus,
    super.validator,
    super.enabled,
    super.readOnly,
    super.expands,
    RxBool? obscureText,
    super.obscuringCharacter,
    TextInputType? keyboardType,
    Iterable<String>? autoFillHints,
    Widget? suffixIcon,
    Widget? prefixIcon,
    BoxConstraints? boxConstraints,
    List<TextInputFormatter>? inputFormatters,
    EdgeInsetsGeometry? contentPadding,
    Color? fillColor,
    bool? filled,
    TextStyle? hintStyle,
    double? borderRadius,
    super.onTap, // Added onTap callback
  })  : assert(
            type != InputType.multiline ||
                textInputAction == TextInputAction.newline,
            'Make textInputAction = TextInputAction.newline'),
        assert(
          (type != InputType.password &&
                  type != InputType.newPassword &&
                  type != InputType.confirmPassword) ||
              obscureText != null,
          'Make sure your providing obscureText and Wrap Obx on TextInputField',
        ),
        super(
          keyboardType: keyboardType ??
              switch (type) {
                InputType.name => TextInputType.name,
                InputType.text => TextInputType.text,
                InputType.email => TextInputType.emailAddress,
                InputType.password => TextInputType.visiblePassword,
                InputType.confirmPassword => TextInputType.visiblePassword,
                InputType.newPassword => TextInputType.visiblePassword,
                InputType.phoneNumber => TextInputType.phone,
                InputType.digits => TextInputType.number,
                InputType.decimalDigits =>
                  const TextInputType.numberWithOptions(decimal: true),
                InputType.multiline => TextInputType.multiline,
              },
          autofillHints: [
            if (autoFillHints != null) ...autoFillHints,
            switch (type) {
              InputType.name => AutofillHints.name,
              InputType.email => AutofillHints.email,
              InputType.password => AutofillHints.password,
              InputType.confirmPassword => AutofillHints.password,
              InputType.newPassword => AutofillHints.newPassword,
              InputType.phoneNumber => AutofillHints.telephoneNumber,
              _ => '',
            },
          ],
          inputFormatters: [
            if (inputFormatters != null) ...inputFormatters,
            if (type == InputType.digits)
              FilteringTextInputFormatter.digitsOnly,
            if (type == InputType.decimalDigits)
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          obscureText: obscureText?.value ?? false,
          textAlignVertical: TextAlignVertical.top,
          style: Get.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Get.theme.customColors.greyTextColor,
          ),
          decoration: InputDecoration(
            hintStyle: hintStyle ??
                Get.theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    color: Get.theme.customColors.greyTextColor,
                    fontWeight: FontWeight.w500),
            hintText: hintLabel,
            contentPadding: contentPadding ?? const EdgeInsets.all(20),
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                prefixIcon!,
                maxLines! > 1
                    ? const SizedBox.shrink()
                    : Container(
                        height: 24,
                        width: 2,
                        color: const Color(0XFF2D2E30),
                      ),
                const Gap(12)
              ],
            ),
            prefixIconConstraints: boxConstraints,
            fillColor: fillColor ?? Get.theme.customColors.textfieldFillColor,
            filled: filled ?? true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 100),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 100),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 100),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 100),
              borderSide: BorderSide(
                color: Get.theme.customColors.red!,
                width: 1.5,
              ),
            ),
            suffixIcon: suffixIcon ??
                (obscureText == null
                    ? null
                    : Builder(
                        builder: (context) {
                          if (type == InputType.email ||
                              type == InputType.password) {}
                          return _SuffixIcon(
                            showing: obscureText,
                          );
                        },
                      )),
          ),
        );
}

enum InputType {
  name,
  text,
  email,
  password,
  confirmPassword,
  newPassword,
  phoneNumber,
  digits,
  decimalDigits,
  multiline,
}
