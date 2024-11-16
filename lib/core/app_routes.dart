import 'package:fastlink_app/presentation/modules/auth/password/reset_password_screen.dart';
import 'package:fastlink_app/presentation/modules/home/account/account_page.dart';
import 'package:fastlink_app/presentation/modules/auth/password/new_password_screen.dart';
import 'package:fastlink_app/presentation/modules/auth/password/password_controller.dart';
import 'package:fastlink_app/presentation/modules/auth/change_password/change_password.dart';
import 'package:fastlink_app/presentation/modules/data/purchase_plan/purchase_plan_controller.dart';
import 'package:fastlink_app/presentation/modules/data/purchase_plan/purchase_plan_screen.dart';
import 'package:fastlink_app/presentation/modules/profile/profile_screen.dart';
import 'package:fastlink_app/presentation/modules/transaction/transaction_controller.dart';
import 'package:fastlink_app/presentation/modules/transaction/transaction_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/card_details/card_details_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/card_details/card_screen_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/cards_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/cards_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/fund_with_card/fund_wallet_card.dart';
import 'package:fastlink_app/presentation/modules/wallet/card_payment/fund_with_card/fund_with_card_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/fund_wallet/fund_wallet_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/fund_wallet/fund_wallet_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/fund_wallet_response/fund_wallet_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/fund_wallet_response/fund_wallet_result_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/congratulations/congrats_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/congratulations/congrats_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/identity/identity_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/identity/identity_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/kyc/kyc_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/kyc/kyc_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/transfer_by_wallet/transfer_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/transfer_payment/transfer_by_wallet/transfer_screen.dart';
import 'package:fastlink_app/presentation/modules/wallet/verify_payment/verify_payment_controller.dart';
import 'package:fastlink_app/presentation/modules/wallet/verify_payment/verify_payment_screen.dart';
import 'package:get/get.dart';

import '../domain/repositories/app_repo.dart';
import '../middleware/app_middleware.dart';
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
import '../presentation/modules/onboarding/onboarding_screen.dart';
import '../presentation/modules/payment/offline_payment/offline_payment_controller.dart.dart';
import '../presentation/modules/payment/offline_payment/offline_payment_screen.dart';
import '../presentation/modules/payment/offline_payment/qr_code_screen.dart';
import '../presentation/modules/payment/top-up/top_up_controller.dart';
import '../presentation/modules/payment/top-up/top_up_screen.dart';

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
  static const fundWalletWithCard = '/fund-card';
  static const cardDetails = '/card-details';
  static const fundWalletResult = '/fund-Wallet-Result';
  static const transferKyc = '/transfer-kyc';
  static const identity = '/identity';
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
  //Profile
  static const editprofile = '/editprofile';
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
      name: Routes.onboarding,
      page: () => OnBoardingScreen(),
    ),
    GetPage(
      name: Routes.buyData,
      page: () => BuyDataScreen(),
      binding: BindingsBuilder(() {
        Get.put(BuyDataController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),
    GetPage(
      name: Routes.dataPlan,
      page: () => DataPlanScreen(),
      binding: BindingsBuilder(() {
        Get.put(DataPlanController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),
    GetPage(
      name: Routes.purchasePlan,
      page: () => PurchasePlanScreen(),
      binding: BindingsBuilder(() {
        Get.put(PurchasePlanController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),
    GetPage(
      name: Routes.fundWallet,
      page: () => FundWalletScreen(),
      binding: BindingsBuilder(() {
        Get.put(FundWalletController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),

    GetPage(
      name: Routes.verifyPayment,
      page: () => VerifyPaymentScreen(),
      binding: BindingsBuilder(() {
        Get.put(VerifyPaymentController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),

      //Fund Wallet With Card.
       GetPage(
      name: Routes.fundWalletWithCard,
      page: () => FundWithCardScreen(),
      binding: BindingsBuilder(() {
        Get.put(FundWithCardController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ), 
    // Card Details
    GetPage(
      name: Routes.cardDetails,
      page: () => CardDetailsScreen(),
      binding: BindingsBuilder(() {
        Get.put(CardDetailsController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ), 
    //fundWalletResult
    GetPage(
      name: Routes.fundWalletResult,
      page: () => FundWalletResultScreen(),
      binding: BindingsBuilder(() {
        Get.put(FundWalletResultController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ), 
    //Transfer
     GetPage(
      name: Routes.transferKyc,
      page: () => KycScreen(),
      binding: BindingsBuilder(() {
        Get.put(KycController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ), 
    //identity
     GetPage(
      name: Routes.identity,
      page: () => IdentityScreen(),
      binding: BindingsBuilder(() {
        Get.put(IdentityController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ), 
    //congrats
     GetPage(
      name: Routes.congrats,
      page: () => CongratsScreen(),
      binding: BindingsBuilder(() {
        Get.put(CongratsController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ), 
    //transfer
     GetPage(
      name: Routes.transfer,
      page: () => TransferScreen(),
      binding: BindingsBuilder(() {
        Get.put(TransferController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ), 
    GetPage(
      name: Routes.cards,
      page: () => CardsScreen(),
      binding: BindingsBuilder(() {
        Get.put(CardsSelectionController());
      }),
      middlewares: [EnsureAuthMiddleware()],
    ),
    //Transaction
    GetPage(
      name: Routes.transactions,
      page: () => TransactionScreen(),
      binding: BindingsBuilder(() {
        Get.put(TransactionController());
      }),
      middlewares: [EnsureAuthMiddleware()],
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
      middlewares: [EnsureNotVerifyingOTPMiddleware()],
    ),

    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.put(PasswordController());
      }),
      middlewares: [EnsureNotVerifyingOTPMiddleware()],
    ),

    GetPage(
      name: Routes.resetPasswordOtp,
      page: () => ResetPasswordOtpScreen(),
      binding: BindingsBuilder(() {
        Get.put(PasswordController());
        Get.put(OtpController());
      }),
      middlewares: [
        EnsureNotSettingNewPasswordMiddleware(),
        EnsureVerifyingOTPMiddleware()
      ],
    ),

    GetPage(
      name: Routes.setNewPassword,
      page: () => SetNewPasswordScreen(),
      binding: BindingsBuilder(() {
        Get.put(PasswordController());
      }),
      middlewares: [
        EnsureSettingNewPasswordMiddleware(),
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
      middlewares: [EnsureAuthMiddleware()],
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
  ];
}
