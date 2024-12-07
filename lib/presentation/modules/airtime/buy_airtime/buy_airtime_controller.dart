import 'package:fastlink_app/data/discount/discount.dart';
import 'package:fastlink_app/data/plan/plan.dart';
import 'package:fastlink_app/domain/repositories/app_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fastlink_app/core/extentions.dart';

import '../../../../core/app_routes.dart';
import '../../../../data/user/user.dart';
import '../../../../domain/repositories/auth_repo.dart';

enum AppOverlay {
  network,
  phone_number,
}

class BuyAirtimeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final overlay = Rxn<AppOverlay>();

  Rx<User> get user => AuthRepository.instance.user;

  final user_plan = Rxn<Plan>();
  final plan_categories = Rxn<PlanCategories>();
  final discounts = Rxn<Discounts>();

  void onNetworkPressed() {
    overlay.value = AppOverlay.network;
  }

  void removeOverlay() {
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

