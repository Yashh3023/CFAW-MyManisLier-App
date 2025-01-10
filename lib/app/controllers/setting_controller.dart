import 'dart:io';

import 'package:injectable/injectable.dart' as i;
import 'package:mymanislier/app/utils/helpers/exporter.dart';

@i.lazySingleton
@i.injectable
class SettingController extends GetxController {
  SettingController() {
    onInit();
  }

  final editProfileNameController = TextEditingController();
  final editProfileEmailController = TextEditingController();

  final changePasswordController = TextEditingController();
  final changeNewPasswordController = TextEditingController();
  final changeConfirmNewPasswordController = TextEditingController();

  final cantactUsNameController = TextEditingController();
  final cantactUsEmailController = TextEditingController();
  final cantactUsSubjectController = TextEditingController();
  final cantactUsMessageController = TextEditingController();

  final reasonController = TextEditingController();

  final tempSelectedImage = Rxn<File>();
  final selectedImage = Rxn<File>();

  final currentPassObscure = true.obs;
  final newPassObscure = true.obs;
  final confirmNewPassObscure = true.obs;

  final currentPassfocusnode = FocusNode();
  final newPassfocusnode = FocusNode();
  final confirmNewPassfocusnode = FocusNode();

  final Rx<int> selectedReasonIndex = (-1).obs;

  final deleteAccountState = ApiState.initial().obs;

  void deleteAccount(BuildContext buildContext) {}
}
