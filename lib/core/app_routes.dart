import 'package:fastlink_app/presentation/modules/airtime/buy_airtime/buy_airtime_screen.dart';
import 'package:fastlink_app/presentation/modules/airtime/profile/profile_controller.dart';
import 'package:fastlink_app/presentation/modules/airtime/profile/profile_screen.dart';
import 'package:fastlink_app/presentation/modules/auth/password/reset_password_screen.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_otp_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_otp_screen.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/change_pin/change_pin_screen.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/new_pin/new_pin_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/transaction_pin/new_pin/new_pin_screen.dart';
import 'package:fastlink_app/presentation/modules/data/profile/login_settings/login_settings_controller.dart';
import 'package:fastlink_app/presentation/modules/data/profile/login_settings/login_settings_screen.dart';
import 'package:fastlink_app/presentation/modules/data/profile/my_profile/my_profile_controller.dart';
import 'package:fastlink_app/presentation/modules/data/profile/my_profile/my_profile_screen.dart';
import 'package:fastlink_app/presentation/modules/data/profile/pin/transaction_pin_screen.dart';
import 'package:fastlink_app/presentation/modules/home/account/account_page.dart';
import 'package:fastlink_app/presentation/modules/auth/password/new_password_screen.dart';
import 'package:fastlink_app/presentation/modules/auth/password/password_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/change_password/change_password.dart';
import 'package:fastlink_app/presentation/modules/data/purchase_plan/purchase_plan_controller.dart';
import 'package:fastlink_app/presentation/modules/data/purchase_plan/purchase_plan_screen.dart';
import 'package:fastlink_app/presentation/modules/onboarding_correct/onboarding_screen.dart';
import 'package:fastlink_app/presentation/modules/profile/profile_screen.dart';
import 'package:fastlink_app/presentation/modules/splash_screen.dart';
import 'package:fastlink_app/presentation/modules/transaction/transaction_controller.dart';
import 'package:fastlink_app/presentation/modules/transaction/transaction_screen.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/card_payment/card_details/card_details_screen.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/card_payment/card_details/card_screen_controller.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/card_payment/cards_controller.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/card_payment/cards_screen.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/card_payment/amount/amount_screen.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/card_payment/amount/amount_controller.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/fund_wallet_controller.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/fund_wallet_screen.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/fund_wallet_response/fund_wallet_controller.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/fund_wallet_response/fund_wallet_result_screen.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/bank_transfer/pages/congrats_screen.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/bank_transfer/pages/identity_page.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/bank_transfer/bank_transfer_controller.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/bank_transfer/bank_transfer_screen.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/bank_transfer/account_display/transfer_controller.dart';
import 'package:fastlink_app/presentation/modules/fund_wallet/bank_transfer/account_display/transfer_screen.dart';
import 'package:fastlink_app/presentation/refer_and_earn/refer_and%20earn_controller.dart';
import 'package:fastlink_app/presentation/refer_and_earn/refer_and_earn_screen.dart';
import 'package:get/get.dart';

import '../domain/repositories/app_repo.dart';
import '../middleware/app_middleware.dart';
import '../presentation/modules/airtime/buy_airtime/buy_airtime_controller.dart';
import '../presentation/modules/auth/login/login_controller.dart';
import '../presentation/modules/auth/login/login_screen.dart';
import '../presentation/modules/auth/otp/otp_controller.dart';
import '../presentation/modules/auth/password/reset_password_otp_screen.dart';
import '../presentation/modules/auth/signup/signup_controller.dart';
import '../presentation/modules/auth/signup/signup_screen.dart';
import '../presentation/modules/auth/change_password/change_password_controller.dart';
import '../presentation/modules/data/buy_data/buy_data_controller.dart';
import '../presentation/modules/data/buy_data/buy_data_screen.dart';
import '../presentation/modules/data/data_plans/data_plan_controller.dart';
import '../presentation/modules/data/data_plans/data_plan_screen.dart';
import '../presentation/modules/home/account/account_controller.dart';
import '../presentation/modules/home/home_controller.dart';
import '../presentation/modules/home/home_screen.dart';
import '../presentation/modules/onboarding_wrong/onboarding_screen.dart';

class Routes {
  // Auth
  static const splash = '/';
  static const onboarding = '/onBoarding';
  static const login = '/login';
  static const forgotPassword = '/forgotPassword';
  static const setNewPassword = '/setNewPassword';
  static const resetPassword = '/resetPassword';
  static const signup = '/signup';
  static const otp = '/otp';
  static const passwordOtp = '/passwordOtp';
  static const resetPasswordOtp = '/resetPasswordOtp';
  static const customerTypeScreen = '/customerTypeScreen';

  // Home
  static const home = '/home';
  static const buyAirtime = '/buy-airtime';

  static const buyData = '/buy-data';
  static const dataPlan = '/data-plan';
  static const purchasePlan = '/purchase-plan';

  static const fundWallet = '/fundWallet';
  static const verifyPayment = '/verify-payment';
  static const cards = '/cards';

  // Wallet
  static const wallet = '/wallet';
  static const transactions = '/transactions';
  static const earnings = '/earnings';
  static const inputAmount = '/fund-card';
  static const cardDetails = '/card-details';
  static const fundWalletResult = '/fund-Wallet-Result';
  static const bankTransfer = '/bank-transfer';
  static const congrats = '/congrats';
  static const transfer = '/transfer';

  static const withdrawal = '/withdrawal';

  // Order history
  static const history = '/history';

  // Settings
  static const settings = '/settings';
  static const editProfile = '/editProfile';
  static const withdrawalPin = '/withdrawalPin';
  static const withdrawalAccount = '/withdrawalAccount';
  static const deleteAccount = '/deleteAccount';

  // Resturant
  static const resturant = '/resturant';
  static const dish = '/foodDescription';
  static const fave = '/fave';
  static const manageRestaurant = '/manageRestaurant';
  static const manageRestaurantII = '/manageRestaurantII';

  // Checkout
  static const checkout = '/checkout';
  static const cart = '/cart';

  // Communication
  static const calling = '/calling';
  static const chatBox = '/chatBox';
  static const chat = '/chat';

  // Others
  static const notifications = '/notifications';
  static const ratings = '/ratings';
  static const riderRatings = '/riderRratings';
  static const reviews = '/reviews';
  static const helpCenter = '/helpCenter';
  static const exphelpCenter = '/exphelpCenter';
  static const share = '/share';
  static const restaurantRating = '/restaurantRating';

  // Account
  static const accountpage = '/accountpage';
  // Change Password.
  static const changePassword = '/change-password';
  //Edit Profile
  static const editprofile = '/editprofile';

  /////////Profile-Screen////////////////
  static const profileScreen = '/profile-screen';

  /////////My-Profile-Screen////////////////
  static const myProfileScreen = '/my-profile-screen';

  /////////My-Login-Settings-Screen////////////////
  static const myLoginSettingsScreen = '/my-login-settings-screen';

    /////////My-Login-Settings-Screen////////////////
  static const transactionPinScreen = '/transaction-pin-screen';


   /////////Change-Pin-Screen////////////////
  static const changePinScreen = '/change-pin-screen';


  
   /////////Change-Pin-Otp-Screen////////////////
  static const changePinOtpScreen = '/change-pin-otp-screen';


   /////////New-Pin-Otp-Screen////////////////
  static const newPinOtpScreen = '/new-pin-otp-screen';


  ////////////////////Referral&Earnings//////////////////////
  static const referralEarnings = '/referral-earnings';


}

// class AuthMiddleware extends GetMiddleware {
//   RouteSettings? redirect(String? route) {
//     String returnUrl = Uri.encodeFull(route ?? '');
//     print(object)
//     return null;
//   }
// }

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: Routes.buyAirtime,
      page: () => BuyAirtimeScreen(),
      binding: BindingsBuilder(() {
        Get.put(BuyAirtimeController());
      }),
    ),
    GetPage(
      name: Routes.buyData,
      page: () => BuyDataScreen(),
      binding: BindingsBuilder(() {
        Get.put(BuyDataController());
      }),
    ),
    GetPage(
      name: Routes.dataPlan,
      page: () => DataPlanScreen(),
      binding: BindingsBuilder(() {
        Get.put(DataPlanController());
      }),
    ),
    GetPage(
      name: Routes.purchasePlan,
      page: () => PurchasePlanScreen(),
      binding: BindingsBuilder(() {
        Get.put(PurchasePlanController());
      }),
    ),
    GetPage(
      name: Routes.fundWallet,
      page: () => FundWalletScreen(),
      binding: BindingsBuilder(() {
        Get.put(FundWalletController());
      }),
      // middlewares: [EnsureAuthMiddleware()],
    ),

    //Fund Wallet With Card.
    GetPage(
      name: Routes.inputAmount,
      page: () => AmmountScreen(),
      binding: BindingsBuilder(() {
        Get.put(AmountController());
      }),
      // middlewares: [EnsureAuthMiddleware()],
    ),

    // Card Details
    GetPage(
      name: Routes.cardDetails,
      page: () => CardDetailsScreen(),
      binding: BindingsBuilder(() {
        Get.put(CardDetailsController());
      }),
      // middlewares: [EnsureAuthMiddleware()],
    ),
    //fundWalletResult
    GetPage(
      name: Routes.fundWalletResult,
      page: () => FundWalletResultScreen(),
      binding: BindingsBuilder(() {
        Get.put(FundWalletResultController());
      }),
      // middlewares: [EnsureAuthMiddleware()],
    ),
    //Transfer
    GetPage(
      name: Routes.bankTransfer,
      page: () => BankTransferScreen(),
      binding: BindingsBuilder(() {
        Get.put(BankTransferController());
      }),
      // middlewares: [EnsureAuthMiddleware()],
    ),
    //congrats
    GetPage(
      name: Routes.congrats,
      page: () => CongratulationsPage(),
      binding: BindingsBuilder(() {
        Get.put(BankTransferController());
      }),
      // middlewares: [EnsureAuthMiddleware()],
    ),
    //transfer
    GetPage(
      name: Routes.transfer,
      page: () => TransferScreen(),
      binding: BindingsBuilder(() {
        Get.put(TransferController());
      }),
      // middlewares: [EnsureAuthMiddleware()],
    ),
    GetPage(
      name: Routes.cards,
      page: () => CardsScreen(),
      binding: BindingsBuilder(() {
        Get.put(CardsSelectionController());
      }),
      // middlewares: [EnsureAuthMiddleware()],
    ),
    //Transaction
    GetPage(
      name: Routes.transactions,
      page: () => TransactionScreen(),
      binding: BindingsBuilder(() {
        Get.put(TransactionController());
      }),
      // middlewares: [EnsureAuthMiddleware()],
    ),
    //   GetPage(
    //     name: Routes.fave,
    //     page: () => FavouriteScreen(),
    //   ),
    //   GetPage(
    //     name: Routes.customerTypeScreen,
    //     page: () => UserTypeScreen(),
    //   ),
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
      // middlewares: [EnsureNotVerifyingOTPMiddleware()],
    ),

    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.put(PasswordController());
      }),
      // middlewares: [EnsureNotVerifyingOTPMiddleware()],
    ),

    GetPage(
      name: Routes.resetPasswordOtp,
      page: () => ResetPasswordOtpScreen(),
      binding: BindingsBuilder(() {
        Get.put(PasswordController());
        Get.put(OtpController());
      }),
      // middlewares: [
      //   EnsureNotSettingNewPasswordMiddleware(),
      //   EnsureVerifyingOTPMiddleware()
      // ],
    ),

    GetPage(
      name: Routes.setNewPassword,
      page: () => SetNewPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.put(PasswordController());
      }),
      middlewares: [
        // EnsureSettingNewPasswordMiddleware(),
      ],
    ),

    //   GetPage(
    //       name: Routes.resetPassword,
    //       page: () => ResetPasswordScreen(),
    //       binding: BindingsBuilder(() {
    //         Get.put(PasswordController());
    //       })),
    GetPage(
      name: Routes.signup,
      page: () => SignupScreen(),
      binding: BindingsBuilder(() {
        Get.put(SignupController());
      }),
      // middlewares: [EnsureNotAuthedMiddleware()],
    ),

    //   GetPage(
    //     name: Routes.otp,
    //     page: () => OtpScreen(),
    //     binding: BindingsBuilder(() {
    //       Get.put(OtpController());
    //     }),
    //   ),
    //   GetPage(
    //     name: Routes.passwordOtp,
    //     page: () => ResetPasswordOtpScreen(),
    //     binding: BindingsBuilder(() {
    //       Get.put(OtpController());
    //     }),
    //   ),
    //   GetPage(
    //     name: Routes.pinOtp,
    //     page: () => PinOtpScreen(),
    //     binding: BindingsBuilder(() {
    //       Get.put(PinOtpController());
    //     }),
    //   ),

    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      transition: Transition.circularReveal,
      binding: BindingsBuilder(() {
        Get.put(AppRepository());
        Get.put(HomeScreenController());
        Get.put(HomePageController());
        Get.put(AccountPageController());
      }),
      // middlewares: [EnsureAuthMiddleware()],
    ),
    // for the accountpage.
    GetPage(
      name: Routes.accountpage,
      page: () => AccountPage(),
    ),
    GetPage(
      name: Routes.changePassword,
      page: () => ChangePasswordScreen(),
      middlewares: [EnsureAuthMiddleware()],
      binding: BindingsBuilder(() {
        Get.put(ChangePasswordController());
      }),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => EditProfileScreen(),
    ),
    ////////////Profile-Screen////////////////

    GetPage(
      name: Routes.profileScreen,
      page: () => ProfileScreen(),
      binding: BindingsBuilder(() {
        Get.put(ProfileController());
      }),
    ),

////////////My-Profile-Screen////////////////
    GetPage(
      name: Routes.myProfileScreen,
      page: () => MyProfileScreen(),
      binding: BindingsBuilder(() {
        Get.put(MyProfileScreenController());
      }),
    ),

////////////My-Login-Settings-Screen////////////////
    GetPage(
      name: Routes.myLoginSettingsScreen,
      page: () => LoginSettingsScreen(),
      binding: BindingsBuilder(() {
        Get.put(LoginSettingsController());
      }),
    ),

////////////Transaction-Pin-Screen////////////////
 GetPage(
      name: Routes.transactionPinScreen,
      page: () => TransactionPinScreen(),
    ),


////////////Change-Pin-Screen////////////////
    GetPage(
      name: Routes.changePinScreen,
      page: () => ChangePinScreen(),
      binding: BindingsBuilder(() {
        Get.put(ChangePinController());
      }),
    ),

////////////Change-Pin-Otp-Screen////////////////
    GetPage(
      name: Routes.changePinOtpScreen,
      page: () => ChangePinOtpScreen(),
      binding: BindingsBuilder(() {
        Get.put(ChangePinOtpController());
      }),
    ),


////////////New-Pin-Otp-Screen////////////////
    GetPage(
      name: Routes.newPinOtpScreen,
      page: () => SetNewPinScreen(),
      binding: BindingsBuilder(() {
        Get.put(NewPinController());
      }),
    ),
///////////referral&Earnings-Screen////////////////
    GetPage(
      name: Routes.referralEarnings,
      page: () => ReferAndEarnScreen(),
      binding: BindingsBuilder(() {
        Get.put(ReferAndEarnController());
      }),
    ),
  ];
}
