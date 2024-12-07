import 'package:fastlink_app/core/extentions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/discount/discount.dart';
import '../../../data/plan/plan.dart';
import '../../../data/user/user.dart';
import '../../../domain/repositories/app_repo.dart';
import '../../../domain/repositories/auth_repo.dart';
import '../../modules/airtime/buy_airtime/buy_airtime_controller.dart';
import '../../utils/constants.dart';

enum MobileNetwork {
  mtn(
    displayName: "MTN",
    imagePath: 'assets/images/mtn_logo.png',
  ),
  airtel(
    displayName: "Airtel",
    imagePath: 'assets/images/mtn_logo.png',
  ),
  glo(
    displayName: "Glo",
    imagePath: 'assets/images/mtn_logo.png',
  ),
  nineMobile(
    displayName: "9Mobile",
    imagePath: 'assets/images/mtn_logo.png',
  );

  final String displayName;
  final String imagePath;

  const MobileNetwork({required this.displayName, required this.imagePath});
}

class PhoneWrapperController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final overlay = Rxn<AppOverlay>();
  final selectedNetwork = MobileNetwork.mtn.obs;

  Rx<User> get user => AuthRepository.instance.user;

  final user_plan = Rxn<Plan>();
  final plan_categories = Rxn<PlanCategories>();
  final discounts = Rxn<Discounts>();

  void onNetworkPressed() {
    overlay.value = AppOverlay.network;
  }

  void onNetworkItemTap(MobileNetwork value) async {
    selectedNetwork.value = value;
    await kAnimationDelay;
    clearOverlay();
  }

  void showPhoneSuggestion() {
    overlay.value = AppOverlay.phone_number;
  }

  void clearOverlay() {
    overlay.value = null;
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future fetchData() async {
    await Future.wait([
      AppRepository.instance.plans(),
      AppRepository.instance.user_plan()
    ]).then((responses) {
      user_plan.value = responses[1] as Plan?;
      final (plans, discounts) = responses[0] as (Plans, Discounts);

      plan_categories.value = PlanCategory.sortPlans(plans, discounts);
      this.discounts.value = discounts;

      // status(RxStatus.success());
    }).catchError((err, stackTrace) {
      plan_categories.value = [];
      if (err is! String) {
        err = err.toString();
      }

      // Error
      showError(err);
    });
  }
}
