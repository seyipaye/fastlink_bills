import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:fastlink_app/data/discount/discount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fastlink_app/core/extentions.dart';

import '../../../../core/app_routes.dart';
import '../../../../data/plan/plan.dart';
import '../../../../data/user/user.dart';
import '../../../../domain/repositories/auth_repo.dart';

class PurchasePlanController extends GetxController {
  final formKey = GlobalKey<FormState>();

  Rx<User> get user => AuthRepository.instance.user;
  final CurrencyTextInputFormatter formatter = CurrencyTextInputFormatter(
      locale: 'en_NG', decimalDigits: 0, symbol: '₦');
  late Plan plan;
  late Discounts? discounts;
  final selected_discount = Rxn<Discount>();
  final DateTime currentDate = DateTime.now();

  @override
  void onInit() {
    super.onInit();
    plan = Get.arguments.plan;
    discounts = Discount.filter_discount(
      plan: plan,
      discounts: Get.arguments.discounts,
    );

    if (discount_is_available) {
      selected_discount.value = discounts!.first;
    }
  }

  get discount_is_available {
    return (discounts?.length ?? 0) != 0;
  }

  get amount_discounted {
    // Calculate discount
    // Check if more than max value, if more return maximum value
    double amount_discounted =
        plan.price * (selected_discount.value?.percentage ?? 0.0);

    if (amount_discounted > (selected_discount.value?.max_price ?? 0)) {
      amount_discounted = selected_discount.value!.max_price;
    }

    return amount_discounted;
  }

  void purchasePlan() {
    showLoadingState;

    AuthRepository.instance
        .purchasePlan(
      plan_id: plan.id,
      discount_id: selected_discount.value?.id,
    )
        .then((msg) {
      // Success, Go Back back
      showMessage(msg, clear: true);
      Get.until((route) => Get.currentRoute == Routes.home);
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err, clear: true);
    });
    return;

    // FocusManager.instance.primaryFocus?.unfocus();

    // final form = formKey.currentState!;
    // if (form.validate()) {
    //   form.save();

    //   // Put back here
    // }
  }
}
