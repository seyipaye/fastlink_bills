import 'package:fastlink_app/core/extentions.dart';
import 'package:fastlink_app/data/user/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_routes.dart';
import '../../../../domain/repositories/auth_repo.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  final resetFormKey = GlobalKey<FormState>();
  final changeFormKey = GlobalKey<FormState>();
  final newFormKey = GlobalKey<FormState>();

  final hidePassword = false.obs;

  late String identifier;
  late String newPassword;
  late String confirmNewPassword;
  late String oldPassword;

  late String confirmPassword;

  TextEditingController emailController = TextEditingController();

  get prev => Get.previousRoute == Routes.changePassword;

  Rx<User> get user => AuthRepository.instance.user;

  @override
  void onInit() {
    super.onInit();
  }

  void hidePasswordPressed() {
    hidePassword.value = !hidePassword.value;
  }

  void setPasswordPressed() {
    FocusManager.instance.primaryFocus?.unfocus();
    final form = newFormKey.currentState!;

    if (form.validate()) {
      form.save();

      if (newPassword != confirmNewPassword) {
        showError('Passwords do not match');
        return;
      }

      showLoadingState;

      AuthRepository.instance
          .forgotPasswordVerify(
        request: user.value.forgot_password!.copyWith(
          new_password: newPassword,
        ),
      )
          .then((msg) {
        // Success
        showMessage(msg, clear: true);
        if (kIsWeb) {
          // Web and mobile behaviours are different
          Get.offAndToNamed(Routes.login);
        } else {
          Get.until((route) => Get.currentRoute == Routes.login);
        }
      }).catchError((err, stackTrace) {
        // Error
        Get.closeAllSnackbars();
        Get.back();
        showError(err);
      });
    }
  }

/*   void onChangePasswordPressed() {
    // final String userId = AppDrawerController.instance.userId.value;

    FocusManager.instance.primaryFocus?.unfocus();
    final form = changeFormKey.currentState!;

    if (form.validate()) {
      form.save();

      if (newPassword != confirmNewPassword) {
        showError('Passwords do not match');
        return;
      }

      showLoadingState;

      AuthRepository.instance
          .changePassword(
              // userId: userId,
              oldPassword: oldPassword,
              newPassword: newPassword)
          .then((msg) {
        // Success
        Get.back();
        Get.back();
        showMessage(msg);
      }).catchError((err, stackTrace) {
        // Error
        Get.closeAllSnackbars();
        Get.back();
        showError(err);
      });
    }
  }
 */

  void onResetPasswordPressed() {
    FocusManager.instance.primaryFocus?.unfocus();

    final form = resetFormKey.currentState!;
    if (form.validate()) {
      form.save();

      showLoadingState;

      identifier = '234${identifier.substring(1)}';

      print(identifier);

      AuthRepository.instance
          .forgetPassword(identifier: identifier)
          .then((msg) {
        // Success
        ;
        showMessage(msg, clear: true);
        Get.toNamed(
          Routes.resetPasswordOtp,
          arguments: (identifier: identifier, pin_id: msg),
        );
      }).catchError((err, stackTrace) {
        // Error
        Get.closeAllSnackbars();
        Get.back();
        showError(err.toString());
      });
    }
  }

  void onCancelPressed() {
    FocusManager.instance.primaryFocus?.unfocus();
    AuthRepository.instance.logOut();
  }

//   void onChangePasswordPressed() {
//     final String customerId = AppDrawerController.instance.customerId.value;

//     // FocusManager.instance.primaryFocus?.unfocus();
//     // final form = changeFormKey.currentState!;

//     // if (form.validate()) {
//     //   form.save();

//     //   if (newPassword != confirmNewPassword) {
//     //     showError('Passwords do not match');
//     //     return;
//     //   }

//       showLoadingState;

//       AuthRepository.instance
//           .changePassword(
//               customerId: customerId,
//               newPassword: newPassword,
//               oldPassword: oldPassword)
//           .then((msg) {
//         // Success
//         Get.back();
//         showMessage(msg);
//         Get.until((route) => Get.currentRoute == Routes.changePassword);
//       }).catchError((err, stackTrace) {
//         // Error
//         Get.closeAllSnackbars();
//         Get.back();
//         showError(err);
//       });
//     }
//   }
// //}
}
