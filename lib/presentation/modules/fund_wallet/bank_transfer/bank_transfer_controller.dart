import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BankTransferController extends GetxController {
  late PageController pageController;
  final pageIndex = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    // _picker = ImagePicker();
    pageController.addListener(() {
      pageIndex.value = pageController.page ?? 0.0;
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void _nextPage() {
    pageController.nextPage(
        duration: kThemeAnimationDuration, curve: Curves.bounceInOut);
  }

  void page1Submit() {
    _nextPage();
  }

  void page2Submit() {
    _nextPage();

    /* FocusManager.instance.primaryFocus?.unfocus();
    final form = page1formKey.currentState!;

    if (form.validate()) {
      form.save();
      if (vendorType.value == VendorType.pharmacy &&
          credentialFile.value == null)
        showError('Credential / Document is required');
      else
    } */
  }

  void page3Submit() {
    Get.back();
  }
}
