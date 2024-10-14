import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:fastlink_app/domain/app_shared_prefs.dart';
import 'package:fastlink_app/domain/repositories/app_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fastlink_app/core/extentions.dart';
import 'package:pwa_install/pwa_install.dart' as pwa;
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/app_routes.dart';
import '../../../../data/user/user.dart';
import '../../../../data/wallet/wallet.dart';
import '../../../../domain/repositories/auth_repo.dart';
import '../../../utils/constants.dart';
import 'fund_wallet_screen.dart';
import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' show parse;
import 'package:html/parser.dart';

enum PaymentError {
  no_free_data(
      'Sorry, you have used up your no-data trials. Kindly OFF your WIFI, and fund your wallet with your Mobile Data'),
  invalid_device(
      "Sorry, your Device cannot install our web app. Kindly use the 'Continue' button"),
  login_failed("Sorry, we can't login automatically");

  const PaymentError(this.msg);

  final String msg;

  @override
  String toString() => '$name: $msg';
}

class FundWalletController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final Rx<num> amount = 0.obs;
  String? type;

  Rx<User> get user => AuthRepository.instance.user;

  final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter(locale: 'en_NG', decimalDigits: 0, symbol: '');

  final paymentResponse = Rxn<FundwalletResponse>();

  void verify_payment({bool self = false}) {
    FocusManager.instance.primaryFocus?.unfocus();

    showLoadingState;

    AppRepository.instance
        .verify_payment(
      reference: paymentResponse.value!.reference,
    )
        .then((response) {
      // Success, Show web page!

      if (response!.status == 'success') {
        showMessage('Payment Successful', clear: true);
        AppSharedPrefs.instance.deleteObject('ref');

        if (kIsWeb && self) {
          Get.offAndToNamed(Routes.home);
        } else {
          Get.until((route) => Get.currentRoute == Routes.home);
        }
      } else {
        showError(
          'Previous payment is pending or failed. Kindly make a new payment',
          clear: true,
        );
        paymentResponse.value = null;
        AppSharedPrefs.instance.deleteObject('ref');
      }
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err, clear: true);
    });
  }

  Future<void> proceed_to_pay() async {
    if (formatter.getUnformattedValue() != 0)
      amount.value = formatter.getUnformattedValue();

    FocusManager.instance.primaryFocus?.unfocus();

    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();

      // Know weather it is card or others
      //'card' or 'others'
      final paymentMethod = await Get.bottomSheet(PaymentMethodBottomSheet());

      if (paymentMethod == 'card') {
        // Take user to Card Screen

        // Get.toNamed(Routes.cards, arguments: amount.value);
        final result = await Get.bottomSheet(CardSelectionBottomSheet());

        if (result is DebitCard) {
          charge_card(result);
          return;
        } else if (result == 'new_card') {
          type = 'card';
        } else {
          type = null;
        }
      } else if (paymentMethod == null) {
        return;
      }

      showLoadingState;

      AppRepository.instance
          .topUp(
        amount: amount.value,
        type: type,
      )
          .then((response) async {
        // Success, Show web page!

        final successful = await _launchUrl(response!.link);
        if (successful) {
          showMessage('Follow the prompts', clear: true);
        }
        // else, an error must have been thrown and this guy under catches it or it displays it itself
      }).catchError((err, stackTrace) {
        if (err is PaymentError) {
          err = err.msg;
        } else {
          err = err.toString();
        }

        print('sssss' + err);
        // Error
        showError(err, clear: true);
      });
    }
  }

  void charge_card(DebitCard card) {
    showLoadingState;

    AppRepository.instance
        .chargeCard(
            authorization_code: card.authorization_code,
            email: card.user_email,
            amount: amount.toString())
        .then((response) {
      // Success, Show web page!

      // if (response!.status == 'success') {
      showMessage('Payment Successful', clear: true);
      // AppSharedPrefs.instance.deleteObject('ref');

      if (kIsWeb) {
        Get.offAndToNamed(Routes.home, arguments: {'reload': true});
      } else {
        Get.until((route) => Get.currentRoute == Routes.home);
      }
      // } else {
      //   showError(
      //     'Previous payment is pending or failed. Kindly make a new payment',
      //     clear: true,
      //   );
      //   paymentResponse.value = null;
      //   AppSharedPrefs.instance.deleteObject('ref');
      // }
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err, clear: true);
    });
  }

  void delete_card(int id) {
    showLoadingState;

    AppRepository.instance.delete_card(id).then((response) {
      // Success, Show web page!
      showMessage(response, clear: true);
    }).catchError((err, stackTrace) {
      if (err is! String) {
        err = err.toString();
      }
      // Error
      showError(err, clear: true);
    });
  }

  void onInstallPressed() {
    if (pwa.PWAInstall().installPromptEnabled) {
      pwa.PWAInstall().promptInstall_();
      debugPrint('Prompt to install');
    } else {
      showError(PaymentError.invalid_device.msg);
    }
  }

  void onContinuePressed() {
    final should_continue = Get.dialog(
      ContinueDialog(
        user_data: user.value.data!,
        onContinuationPressed: () => Get.back(result: true),
      ),
    );

    if (should_continue == true) {
      Get.back(result: should_continue);
    }
  }

  Future<bool> _launchUrl(String url) async {
    // Check if phone is connected to the internet, if not show message
    // http://10.5.50.1/login?username=seyi@gmail.com&password=Test&popup=false&dst=https://foodelo.africa

    if (await is_disconnected()) {
      // Attemt to give free data & login

      // Check if there are still free attempts
      // user.value.data?.free_data_attempts_left == 0
      if (user.value.data?.free_data_attempts_left == 0) {
        throw PaymentError.no_free_data;
      }

      // Check if it is on an android web app and web app is not installed
      // kIsWebAndroid && pwa.PWAInstall().installPromptEnabled
      if (kIsWebAndroid) {
        // Show a page to tell android web users, that they need to install app to continue

        final should_continue = await Get.dialog(AndroidPaymentPromptPage());
        if (!should_continue) {
          return false;
        }
      }

      // Claim free Data & Get credentials

      final response = await AppRepository.instance.claim_free_data();

      // Check if exahusted
      if (response!.contains("exahusted")) {
        throw PaymentError.no_free_data;
      }

      // Get credentials
      final credentials = await AuthRepository.instance.user_credentials;

      // I guess it should log out the person first
      if (credentials != null) {
        url =
            'http://10.5.50.1/login?username=${credentials.email}&password=${credentials.password}&popup=false&dst=$url';
      } else {
        throw PaymentError.login_failed;
      }
    }

    return launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: kIsWebAndroid ? '_blank' : '_self',
    );
  }

  Future<bool> is_disconnected() async {
    // if (kDebugMode && kIsWeb) return false;
    // return true;
    final url = Uri.parse(kConnectionTestUrl);
    try {
      final response = await http.get(url);
      // Comment out to show the error message
      if (response.statusCode == 200) {
        print('connected to internet');
        return false;
      }
    } catch (e) {
      // Else show error message
      print('disconnected to internet, caught error');
      print(e.toString());
      return true;
    }
    // Else show error message
    print('Nothing: Got to the end');
    return true;
  }

  Future<bool> show_error_page() async {
    // Attempt to claim free data
    // Attempt to login locally ---> How do i Know if this failed? so i can give an error message

    // Claim free data

    final claim_data_response = await AppRepository.instance.claim_free_data();

    if (claim_data_response?.contains("exahusted") ?? false) {
      print('error from claim_free_data');

      // Attempt login subtle
      final success = await connect_to_hotspot(subtle: true);

      if (success == true) return Future.value(false);

      showError(claim_data_response, clear: false);
    } else {
      // Attempt login
      final success = await connect_to_hotspot();

      if (success == true) return Future.value(false);
    }

    Get.close(1); // Close Loading Page
    Get.dialog(PaymentErrorPage());
    return Future.value(true);
  }

  Future connect_to_hotspot({bool subtle = false}) async {
    // 1 Check if password is present locally
    // 2 Get password from server if not present
    // 3 Store it locally if not present
    // 3 Use it to login the user when there is an attempt to buy data

    // Check for user password
    final credentials = await AuthRepository.instance.user_credentials;

    // I guess it should log out the person first
    if (credentials != null) {
      final pay_load = {
        'username': 'seyi@gmail.com',
        'password': 'Test',
        'dst': 'https://usefastlink.com',
        'popup': 'false',
      };

      try {
        final response = await GetConnect().post(
          kCaptiveLogin,
          pay_load,
          headers: {
            'Host': 'wifi.usefastlink.com',
            'Origin': 'http://wifi.usefastlink.com',
            'Referer': 'http://wifi.usefastlink.com/login?'
          },
          contentType: 'application/x-www-form-urlencoded',
        );

        // Comment out to show the error message
        if (response.statusCode == 200 &&
            connection_successful(response.bodyString)) {
          // Continue payment request
          return true;
        }
      } catch (e) {
        // Get.close(1);
        // Else show error message

        print('dffdffdf' + e.toString());
        if (!subtle) {
          return false;
        } else {
          return true;
        }
      }
      // Get.close(1);
      if (!subtle) {
        return false;
      } else {
        return true;
      }
    }
  }

  bool connection_successful(response) {
    // final response = kHtmlLogin;
    // To know if it is sucessfull
    print(response);
    var document = parse(response);
    if (response.contains('You are logged in')) {
      return true;
    } else {
      // throw error if unsuccessful
      final error =
          document.body?.getElementsByClassName('info alert').first.text;
      // print(error);
      throw (error ?? '');
    }
  }

  FundwalletResponse? get lastPayment {
    if (AppSharedPrefs.instance.getObject('ref') != null)
      return FundwalletResponse.fromJson(
          AppSharedPrefs.instance.getObject('ref'));

    return null;
  }

  void onTextChanged(String value) {
    if (formatter.getUnformattedValue() != 0)
      amount.value = formatter.getUnformattedValue();
  }
}
